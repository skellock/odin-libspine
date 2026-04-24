# =-=-=-=-=- Hello! =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
#
# This script generates the Odin bindings required to work with the Spine 4.3+
# C library.
#
# Run it from the root directory of this repo and provide it the path to the
# spine-runtimes repo on your local computer. Don't forget to switch to the
# 4.3-beta branch it.
#
# > ruby convert.rb <path/to/the/spine-runtimes>
#
# The output will be saved to the libspine/libspine.odin

# =-=-=-=-=- Monkey Patching String =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

class String
  def snake_case
    # https://github.com/rubyworks/facets/blob/main/lib/core/facets/string/snakecase.rb
    self.gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').gsub(/([a-z\d])([A-Z])/, '\1_\2')
      .tr('-', '_').gsub(/\s/, '_').gsub(/__+/, '_').downcase
  end

  def title_case
    # https://github.com/rubyworks/facets/blob/main/lib/core/facets/string/titlecase.rb
    self.tr('_', ' ').gsub(/\s+/, ' ')
      .gsub(/\b\w/) { ::Regexp.last_match.pre_match[-1, 1] == "'" ? ::Regexp.last_match(0) : ::Regexp.last_match(0).upcase }
  end

  def pascal_case
    self.snake_case.title_case.gsub(' ', '')
  end

  def to_odin_type
    clean = self.gsub('/*@null*/', '').gsub('spine_', '').strip

    # nothingness
    return '' if clean == 'void'

    # raw pointer
    return 'rawptr' if clean == 'void *'

    # c goodies
    return 'c.int' if clean == 'int'
    return 'c.size_t' if clean == 'size_t'
    return 'c.ushort' if clean == 'unsigned short'
    return 'c.int32_t' if clean == 'int32_t'
    return 'c.int64_t' if clean == 'int64_t'
    return 'c.float' if clean == 'float'
    return 'c.bool' if clean == 'bool'
    return 'c.int' if clean == 'const int'
    return 'cstring' if clean == 'const char *'

    # multi-pointers
    return '[^]c.uchar' if clean == 'const unsigned char *'
    return '[^]c.uint8_t' if clean == 'const uint8_t *'
    return '[^]c.float' if clean == 'float *'
    return '[^]c.int' if clean == 'int *'
    return '[^]c.ushort' if clean == 'unsigned short *'
    return '[^]c.int16_t' if clean == 'int16_t *'
    return '[^]c.uint16_t' if clean == 'uint16_t *'
    return '[^]c.int32_t' if clean == 'int32_t *'
    return '[^]c.uint32_t' if clean == 'uint32_t *'
    return '[^]c.int64_t' if clean == 'int64_t *'

    # multi-pointer of a spine opaque type
    return "[^]#{clean.pascal_case}".gsub('*', '') if clean.end_with?('*')

    # spine opaque type
    clean.pascal_case
  end

  def to_odin_param
    clean = self.gsub('/*@null*/', '').strip

    return nil if clean == 'void'

    star_split = clean.split('*')
    if star_split.length == 2
      type_with_star = "#{star_split.first}*"
      return "#{star_split.last.snake_case}: #{type_with_star.to_odin_type}"
    end

    space_split = clean.split(' ')
    if space_split.length == 2
      return "#{space_split.last.snake_case}: #{space_split.first.to_odin_type}"
    elsif space_split.length == 3
      return "#{space_split.last.snake_case}: #{space_split[0..1].join(' ').to_odin_type}"
    end

    clean
  end
end

# =-=-=-=-=- Setup Paths =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

spine_runtimes_repo = ARGV[0]

paths = Data
  .define(:spine_runtimes_repo, :header, :src, :generated, :odin_output)
  .new(
    spine_runtimes_repo: spine_runtimes_repo,
    header: "#{spine_runtimes_repo}/spine-c/include/spine-c.h",
    src: "#{spine_runtimes_repo}/spine-c/src",
    generated: "#{spine_runtimes_repo}/spine-c/src/generated",
    odin_output: 'libspine/libspine.odin'
  )

# =-=-=-=-=- Sanity Checks =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

if spine_runtimes_repo.nil? || spine_runtimes_repo.empty?
  puts '[error] pass the path to the spines-runtime repo as a parameter'
  puts '[error] '
  puts '[error] you can download it from https://github.com/esotericSoftware/spine-runtimes'
  exit 1
end

unless Dir.exist?(paths.spine_runtimes_repo)
  puts "[error] #{paths.spine_runtimes_repo} is not a valid directory"
  exit 1
end

unless Dir.exist?(paths.generated)
  puts "[error] #{paths.generated} directory does not exist - make sure to run spine's build script"
  puts '[error] '
  puts "[error]   cd #{paths.spine_runtimes_repo}"
  puts '[error]   ./build.sh codegen'
  exit 1
end

# =-=-=-=-=- Load Header =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

INCLUDE_SRC = '#include "../src/'.freeze
c_header_output = []

File.read(paths.header).split("\n").each do |spine_c_line|
  if spine_c_line.start_with?(INCLUDE_SRC) && !spine_c_line.include?('generated')
    new_include = spine_c_line.gsub(INCLUDE_SRC, '').gsub('"', '')
    c_header_output.concat(File.read("#{paths.src}/#{new_include}").split("\n"))
  else
    c_header_output << spine_c_line
  end
end

Dir["#{paths.src}/generated/*.h"].each do |h_file|
  c_header_output.concat(File.read(h_file).split("\n"))
  c_header_output << ''
end

# =-=-=-=-=- Odin File Header =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

odin_output = []
odin_output << 'package spine'
odin_output << ''
odin_output << 'import "core:c"'
odin_output << ''
odin_output << 'when ODIN_OS == .Windows {'
odin_output << '    foreign import lib "libspine-c.lib"'
odin_output << '} else when ODIN_OS == .Darwin {'
odin_output << '    foreign import lib { "libspine-c.a", "libspine-cpp.a", "system:c++" }'
odin_output << '} else when ODIN_OS == .Linux {'
odin_output << '    foreign import lib "libspine-c.so"'
odin_output << '}'
odin_output << ''

# =-=-=-=-=- Types =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

# defined in base
odin_output << 'PropertyId :: distinct c.longlong'
odin_output << ''

# defined in extensions
odin_output << 'DisposeRendererObject :: #type proc "c" (renderer: rawptr)'
odin_output << 'TextureLoaderLoadFunc :: #type proc "c" (path: cstring) -> rawptr'
odin_output << 'TextureLoaderUnloadFunc :: #type proc "c" (texture: rawptr)'
odin_output << 'AnimationStateListener :: #type proc "c" (state: AnimationState, type: EventType, entry: TrackEntry, event: Event, data: rawptr) -> rawptr'
odin_output << ''

c_header_output
  .filter { |line| line.start_with?('SPINE_OPAQUE_TYPE(') }
  .map { |line| line.gsub('SPINE_OPAQUE_TYPE(', '').gsub(')', '') }
  .each do |line|
    name = line.gsub('spine_', '').pascal_case
    odin_output << "#{name} :: distinct rawptr"
  end
odin_output << ''

# =-=-=-=-=- Enums =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

enum_name = ''
enum_lines = []
is_collecting = false
c_header_output.each do |h_line|
  if h_line.start_with?('typedef enum ')
    enum_name = h_line.split(' ')[2]
    enum_lines = []
    is_collecting = true
    next
  end
  if is_collecting
    if h_line == "} #{enum_name};"
      is_collecting = false
      name = enum_name.gsub('spine_', '').pascal_case
      odin_output << "#{name} :: enum c.int {"
      enum_lines.each do |enum_line|
        odin_output << "    #{enum_line},"
      end
      odin_output << '}'
      odin_output << ''
      next
    else
      enum_line = h_line
        .gsub(',', '')
        .gsub('SPINE_', '')
        .gsub("#{enum_name.gsub('spine_', '').upcase}_", '')
        .strip

      if enum_line.include?('=')
        splits = enum_line.split('=').map(&:strip)
        enum_lines << "#{splits[0].pascal_case} = #{splits[1]}"
      else
        enum_lines << enum_line.pascal_case
      end
    end
  end
end

# =-=-=-=-=- Functions =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

fn_lines = []
fn_line = []
is_collecting = false
c_header_output.each do |h_line|
  line = h_line

  if line.start_with?('SPINE_C_API')
    fn_line = []
    is_collecting = true
  end

  if is_collecting
    if line.end_with?(';')
      is_collecting = false
      fn_line << line
      raw_line = fn_line
        .map(&:strip)
        .join(' ')
        .gsub(';', '')
        .gsub('SPINE_C_API ', '')

      idx_of_open_paren = raw_line.index('(')
      idx_of_close_paren = raw_line.index(')')
      up_to_paren = raw_line[0...idx_of_open_paren]
      in_paren = raw_line[(idx_of_open_paren + 1)...idx_of_close_paren]
      fn_name = up_to_paren.split(' ').last.gsub('*', '')[6..]
      idx_of_fn_name = raw_line.index(fn_name)
      return_type = raw_line[0...idx_of_fn_name].to_odin_type

      odin_line = ''
      odin_line << fn_name
      odin_line << ' :: proc('
      params = []
      in_paren.split(',').each do |raw_param|
        param = raw_param.strip
        next if param == 'void'

        params << param.gsub('/*@null*/ ', '').to_odin_param
      end
      odin_line << params.join(', ')
      odin_line << ')'
      odin_line << " -> #{return_type}" unless return_type.empty?
      odin_line << ' ---'

      fn_lines << odin_line
      fn_line = []
    else
      fn_line << line.strip
    end
  end
end

odin_output << '@(default_calling_convention = "c", link_prefix = "spine_")'
odin_output << 'foreign lib {'
fn_lines.each do |fn_line|
  odin_output << "    #{fn_line}"
end
odin_output << '}'
odin_output << ''

File.write(paths.odin_output, odin_output.join("\n"))

puts "#{paths.odin_output} generated"
