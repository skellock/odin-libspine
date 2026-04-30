package spine

import "core:c"

when ODIN_OS == .Windows {
	foreign import lib "libspine-c.lib"
} else when ODIN_OS == .Darwin {
	foreign import lib {"macos/libspine-c.a", "macos/libspine-cpp.a", "system:c++"}
} else when ODIN_OS == .Linux {
	foreign import lib {"linux-x86_64/libspine-c.a", "linux-x86_64/libspine-cpp.a", "system:stdc++"}
}

PropertyId :: distinct c.longlong

DisposeRendererObject :: #type proc "c" (renderer: rawptr)
TextureLoaderLoadFunc :: #type proc "c" (path: cstring) -> rawptr
TextureLoaderUnloadFunc :: #type proc "c" (texture: rawptr)
AnimationStateListener :: #type proc "c" (
	state: AnimationState,
	type: EventType,
	entry: TrackEntry,
	event: Event,
	data: rawptr,
) -> rawptr

AtlasResult :: distinct rawptr
SkeletonDataResult :: distinct rawptr
SkeletonDrawable :: distinct rawptr
AnimationStateEvents :: distinct rawptr
SkinEntry :: distinct rawptr
SkinEntries :: distinct rawptr
TextureLoader :: distinct rawptr
ArrayFloat :: distinct rawptr
ArrayInt :: distinct rawptr
ArrayUnsignedShort :: distinct rawptr
ArrayPropertyId :: distinct rawptr
ArrayAnimation :: distinct rawptr
ArrayAtlasPage :: distinct rawptr
ArrayAtlasRegion :: distinct rawptr
ArrayAttachment :: distinct rawptr
ArrayBone :: distinct rawptr
ArrayBoneData :: distinct rawptr
ArrayBonePose :: distinct rawptr
ArrayBoundingBoxAttachment :: distinct rawptr
ArrayConstraint :: distinct rawptr
ArrayConstraintData :: distinct rawptr
ArrayEvent :: distinct rawptr
ArrayEventData :: distinct rawptr
ArrayFromProperty :: distinct rawptr
ArrayPhysicsConstraint :: distinct rawptr
ArrayPolygon :: distinct rawptr
ArraySkin :: distinct rawptr
ArraySlot :: distinct rawptr
ArraySlotData :: distinct rawptr
ArrayTextureRegion :: distinct rawptr
ArrayTimeline :: distinct rawptr
ArrayToProperty :: distinct rawptr
ArrayTrackEntry :: distinct rawptr
ArrayUpdate :: distinct rawptr
AlphaTimeline :: distinct rawptr
Animation :: distinct rawptr
AnimationState :: distinct rawptr
AnimationStateData :: distinct rawptr
Atlas :: distinct rawptr
AtlasAttachmentLoader :: distinct rawptr
AtlasPage :: distinct rawptr
AtlasRegion :: distinct rawptr
Attachment :: distinct rawptr
AttachmentLoader :: distinct rawptr
AttachmentTimeline :: distinct rawptr
Bone :: distinct rawptr
BoneData :: distinct rawptr
BoneLocal :: distinct rawptr
BonePose :: distinct rawptr
BoneTimeline :: distinct rawptr
BoneTimeline1 :: distinct rawptr
BoneTimeline2 :: distinct rawptr
BoundingBoxAttachment :: distinct rawptr
ClippingAttachment :: distinct rawptr
Color :: distinct rawptr
Constraint :: distinct rawptr
ConstraintData :: distinct rawptr
ConstraintTimeline :: distinct rawptr
ConstraintTimeline1 :: distinct rawptr
CurveTimeline :: distinct rawptr
CurveTimeline1 :: distinct rawptr
DeformTimeline :: distinct rawptr
DrawOrder :: distinct rawptr
DrawOrderFolderTimeline :: distinct rawptr
DrawOrderTimeline :: distinct rawptr
Event :: distinct rawptr
EventData :: distinct rawptr
EventQueueEntry :: distinct rawptr
EventTimeline :: distinct rawptr
FromProperty :: distinct rawptr
FromRotate :: distinct rawptr
FromScaleX :: distinct rawptr
FromScaleY :: distinct rawptr
FromShearY :: distinct rawptr
FromX :: distinct rawptr
FromY :: distinct rawptr
IkConstraint :: distinct rawptr
IkConstraintBase :: distinct rawptr
IkConstraintData :: distinct rawptr
IkConstraintPose :: distinct rawptr
IkConstraintTimeline :: distinct rawptr
InheritTimeline :: distinct rawptr
LinkedMesh :: distinct rawptr
MeshAttachment :: distinct rawptr
PathAttachment :: distinct rawptr
PathConstraint :: distinct rawptr
PathConstraintBase :: distinct rawptr
PathConstraintData :: distinct rawptr
PathConstraintMixTimeline :: distinct rawptr
PathConstraintPose :: distinct rawptr
PathConstraintPositionTimeline :: distinct rawptr
PathConstraintSpacingTimeline :: distinct rawptr
PhysicsConstraint :: distinct rawptr
PhysicsConstraintBase :: distinct rawptr
PhysicsConstraintDampingTimeline :: distinct rawptr
PhysicsConstraintData :: distinct rawptr
PhysicsConstraintGravityTimeline :: distinct rawptr
PhysicsConstraintInertiaTimeline :: distinct rawptr
PhysicsConstraintMassTimeline :: distinct rawptr
PhysicsConstraintMixTimeline :: distinct rawptr
PhysicsConstraintPose :: distinct rawptr
PhysicsConstraintResetTimeline :: distinct rawptr
PhysicsConstraintStrengthTimeline :: distinct rawptr
PhysicsConstraintTimeline :: distinct rawptr
PhysicsConstraintWindTimeline :: distinct rawptr
PointAttachment :: distinct rawptr
Polygon :: distinct rawptr
Posed :: distinct rawptr
PosedActive :: distinct rawptr
PosedData :: distinct rawptr
RegionAttachment :: distinct rawptr
RenderCommand :: distinct rawptr
Rgb2Timeline :: distinct rawptr
Rgba2Timeline :: distinct rawptr
RgbaTimeline :: distinct rawptr
RgbTimeline :: distinct rawptr
RotateTimeline :: distinct rawptr
Rtti :: distinct rawptr
ScaleTimeline :: distinct rawptr
ScaleXTimeline :: distinct rawptr
ScaleYTimeline :: distinct rawptr
Sequence :: distinct rawptr
SequenceTimeline :: distinct rawptr
ShearTimeline :: distinct rawptr
ShearXTimeline :: distinct rawptr
ShearYTimeline :: distinct rawptr
Skeleton :: distinct rawptr
SkeletonBinary :: distinct rawptr
SkeletonBounds :: distinct rawptr
SkeletonClipping :: distinct rawptr
SkeletonData :: distinct rawptr
SkeletonJson :: distinct rawptr
SkeletonRenderer :: distinct rawptr
Skin :: distinct rawptr
Slider :: distinct rawptr
SliderBase :: distinct rawptr
SliderData :: distinct rawptr
SliderMixTimeline :: distinct rawptr
SliderPose :: distinct rawptr
SliderTimeline :: distinct rawptr
Slot :: distinct rawptr
SlotCurveTimeline :: distinct rawptr
SlotData :: distinct rawptr
SlotPose :: distinct rawptr
SlotTimeline :: distinct rawptr
TextureRegion :: distinct rawptr
Timeline :: distinct rawptr
ToProperty :: distinct rawptr
ToRotate :: distinct rawptr
ToScaleX :: distinct rawptr
ToScaleY :: distinct rawptr
ToShearY :: distinct rawptr
ToX :: distinct rawptr
ToY :: distinct rawptr
TrackEntry :: distinct rawptr
TransformConstraint :: distinct rawptr
TransformConstraintBase :: distinct rawptr
TransformConstraintData :: distinct rawptr
TransformConstraintPose :: distinct rawptr
TransformConstraintTimeline :: distinct rawptr
TranslateTimeline :: distinct rawptr
TranslateXTimeline :: distinct rawptr
TranslateYTimeline :: distinct rawptr
Update :: distinct rawptr
VertexAttachment :: distinct rawptr

AttachmentType :: enum c.int {
	Region,
	Boundingbox,
	Mesh,
	Linkedmesh,
	Path,
	Point,
	Clipping,
}

BlendMode :: enum c.int {
	Normal = 0,
	Additive,
	Multiply,
	Screen,
}

EventType :: enum c.int {
	Start = 0,
	Interrupt,
	End,
	Dispose,
	Complete,
	Event,
}

Format :: enum c.int {
	Alpha,
	Intensity,
	LuminanceAlpha,
	Rgb565,
	Rgba4444,
	Rgb888,
	Rgba8888,
}

Inherit :: enum c.int {
	Normal = 0,
	OnlyTranslation,
	NoRotationOrReflection,
	NoScale,
	NoScaleOrReflection,
}

Physics :: enum c.int {
	None,
	Reset,
	Update,
	Pose,
}

PositionMode :: enum c.int {
	Fixed = 0,
	Percent,
}

Property :: enum c.int {
	Rotate = 0,
	X,
	Y,
	ScaleX,
	ScaleY,
	ShearX,
	ShearY,
	Inherit,
	Rgb,
	Alpha,
	Rgb2,
	Attachment,
	Deform,
	Event,
	DrawOrder,
	IkConstraint,
	TransformConstraint,
	PathConstraintPosition,
	PathConstraintSpacing,
	PathConstraintMix,
	PhysicsConstraintInertia,
	PhysicsConstraintStrength,
	PhysicsConstraintDamping,
	PhysicsConstraintMass,
	PhysicsConstraintWind,
	PhysicsConstraintGravity,
	PhysicsConstraintMix,
	PhysicsConstraintReset,
	Sequence,
	SliderTime,
	SliderMix,
	DrawOrderFolder,
}

RotateMode :: enum c.int {
	Tangent = 0,
	Chain,
	ChainScale,
}

SequenceMode :: enum c.int {
	Hold            = 0,
	Once            = 1,
	Loop            = 2,
	Pingpong        = 3,
	OnceReverse     = 4,
	LoopReverse     = 5,
	PingpongReverse = 6,
}

SpacingMode :: enum c.int {
	Length = 0,
	Fixed,
	Percent,
	Proportional,
}

TextureFilter :: enum c.int {
	Unknown,
	Nearest,
	Linear,
	MipMap,
	MipMapNearestNearest,
	MipMapLinearNearest,
	MipMapNearestLinear,
	MipMapLinearLinear,
}

TextureWrap :: enum c.int {
	MirroredRepeat,
	ClampToEdge,
	Repeat,
}

@(default_calling_convention = "c", link_prefix = "spine_")
foreign lib {
	major_version :: proc() -> c.int32_t ---
	minor_version :: proc() -> c.int32_t ---
	enable_debug_extension :: proc(enable: c.bool) ---
	report_leaks :: proc() ---
	atlas_load :: proc(atlas_data: cstring) -> AtlasResult ---
	atlas_load_callback :: proc(atlas_data: cstring, atlas_dir: cstring, load: TextureLoaderLoadFunc, unload: TextureLoaderUnloadFunc) -> AtlasResult ---
	atlas_result_get_error :: proc(result: AtlasResult) -> cstring ---
	atlas_result_get_atlas :: proc(result: AtlasResult) -> Atlas ---
	atlas_result_dispose :: proc(result: AtlasResult) ---
	skeleton_data_load_json :: proc(atlas: Atlas, skeleton_data: cstring, path: cstring) -> SkeletonDataResult ---
	skeleton_data_load_binary :: proc(atlas: Atlas, skeleton_data: [^]c.uint8_t, length: c.int32_t, path: cstring) -> SkeletonDataResult ---
	skeleton_data_result_get_error :: proc(result: SkeletonDataResult) -> cstring ---
	skeleton_data_result_get_data :: proc(result: SkeletonDataResult) -> SkeletonData ---
	skeleton_data_result_dispose :: proc(result: SkeletonDataResult) ---
	skeleton_drawable_create :: proc(skeleton_data: SkeletonData) -> SkeletonDrawable ---
	skeleton_drawable_update :: proc(drawable: SkeletonDrawable, delta: c.float) ---
	skeleton_drawable_render :: proc(drawable: SkeletonDrawable) -> RenderCommand ---
	skeleton_drawable_dispose :: proc(drawable: SkeletonDrawable) ---
	skeleton_drawable_get_skeleton :: proc(drawable: SkeletonDrawable) -> Skeleton ---
	skeleton_drawable_get_animation_state :: proc(drawable: SkeletonDrawable) -> AnimationState ---
	skeleton_drawable_get_animation_state_data :: proc(drawable: SkeletonDrawable) -> AnimationStateData ---
	skeleton_drawable_get_animation_state_events :: proc(drawable: SkeletonDrawable) -> AnimationStateEvents ---
	animation_state_events_get_num_events :: proc(events: AnimationStateEvents) -> c.int32_t ---
	animation_state_events_get_event_type :: proc(events: AnimationStateEvents, index: c.int32_t) -> c.int32_t ---
	animation_state_events_get_track_entry :: proc(events: AnimationStateEvents, index: c.int32_t) -> TrackEntry ---
	animation_state_events_get_event :: proc(events: AnimationStateEvents, index: c.int32_t) -> Event ---
	animation_state_events_reset :: proc(events: AnimationStateEvents) ---
	skin_get_entries :: proc(skin: Skin) -> SkinEntries ---
	skin_entries_dispose :: proc(entries: SkinEntries) ---
	skin_entries_get_num_entries :: proc(entries: SkinEntries) -> c.int32_t ---
	skin_entries_get_entry :: proc(entries: SkinEntries, index: c.int32_t) -> SkinEntry ---
	skin_entry_get_slot_index :: proc(entry: SkinEntry) -> c.int32_t ---
	skin_entry_get_name :: proc(entry: SkinEntry) -> cstring ---
	skin_entry_get_attachment :: proc(entry: SkinEntry) -> Attachment ---
	skeleton_get_bounds :: proc(skeleton: Skeleton, output: ArrayFloat) ---
	skeleton_get_position_v :: proc(skeleton: Skeleton, output: ArrayFloat) ---
	bone_pose_world_to_local_v :: proc(self: BonePose, world_x: c.float, world_y: c.float, output: ArrayFloat) ---
	bone_pose_local_to_world_v :: proc(self: BonePose, local_x: c.float, local_y: c.float, output: ArrayFloat) ---
	bone_pose_world_to_parent_v :: proc(self: BonePose, world_x: c.float, world_y: c.float, output: ArrayFloat) ---
	bone_pose_parent_to_world_v :: proc(self: BonePose, parent_x: c.float, parent_y: c.float, output: ArrayFloat) ---
	animation_state_set_listener :: proc(state: AnimationState, listener: AnimationStateListener, user_data: rawptr) ---
	track_entry_set_listener :: proc(entry: TrackEntry, listener: AnimationStateListener, user_data: rawptr) ---
	alpha_timeline_create :: proc(frame_count: c.size_t, bezier_count: c.size_t, slot_index: c.int) -> AlphaTimeline ---
	alpha_timeline_dispose :: proc(self: AlphaTimeline) ---
	alpha_timeline_get_rtti :: proc(self: AlphaTimeline) -> Rtti ---
	alpha_timeline_apply :: proc(self: AlphaTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	alpha_timeline_get_slot_index :: proc(self: AlphaTimeline) -> c.int ---
	alpha_timeline_set_slot_index :: proc(self: AlphaTimeline, in_value: c.int) ---
	alpha_timeline_set_frame :: proc(self: AlphaTimeline, frame: c.size_t, time: c.float, value: c.float) ---
	alpha_timeline_get_curve_value :: proc(self: AlphaTimeline, time: c.float) -> c.float ---
	alpha_timeline_get_relative_value :: proc(self: AlphaTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	alpha_timeline_get_absolute_value_1 :: proc(self: AlphaTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	alpha_timeline_get_absolute_value_2 :: proc(self: AlphaTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float, value: c.float) -> c.float ---
	alpha_timeline_get_scale_value :: proc(self: AlphaTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, current: c.float, setup: c.float) -> c.float ---
	alpha_timeline_set_linear :: proc(self: AlphaTimeline, frame: c.size_t) ---
	alpha_timeline_set_stepped :: proc(self: AlphaTimeline, frame: c.size_t) ---
	alpha_timeline_set_bezier :: proc(self: AlphaTimeline, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	alpha_timeline_get_bezier_value :: proc(self: AlphaTimeline, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	alpha_timeline_get_curves :: proc(self: AlphaTimeline) -> ArrayFloat ---
	alpha_timeline_get_additive :: proc(self: AlphaTimeline) -> c.bool ---
	alpha_timeline_get_instant :: proc(self: AlphaTimeline) -> c.bool ---
	alpha_timeline_get_frame_entries :: proc(self: AlphaTimeline) -> c.size_t ---
	alpha_timeline_get_frame_count :: proc(self: AlphaTimeline) -> c.size_t ---
	alpha_timeline_get_frames :: proc(self: AlphaTimeline) -> ArrayFloat ---
	alpha_timeline_get_duration :: proc(self: AlphaTimeline) -> c.float ---
	alpha_timeline_get_property_ids :: proc(self: AlphaTimeline) -> ArrayPropertyId ---
	alpha_timeline_rtti :: proc() -> Rtti ---
	animation_create :: proc(name: cstring) -> Animation ---
	animation_dispose :: proc(self: Animation) ---
	animation_get_timelines :: proc(self: Animation) -> ArrayTimeline ---
	animation_set_timelines :: proc(self: Animation, timelines: ArrayTimeline, bones: ArrayInt) ---
	animation_has_timeline :: proc(self: Animation, ids: ArrayPropertyId) -> c.bool ---
	animation_get_duration :: proc(self: Animation) -> c.float ---
	animation_set_duration :: proc(self: Animation, in_value: c.float) ---
	animation_apply :: proc(self: Animation, skeleton: Skeleton, last_time: c.float, time: c.float, loop: c.bool, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	animation_get_name :: proc(self: Animation) -> cstring ---
	animation_get_bones :: proc(self: Animation) -> ArrayInt ---
	animation_search_1 :: proc(values: ArrayFloat, target: c.float) -> c.int ---
	animation_search_2 :: proc(values: ArrayFloat, target: c.float, step: c.int) -> c.int ---
	animation_state_create :: proc(data: AnimationStateData) -> AnimationState ---
	animation_state_dispose :: proc(self: AnimationState) ---
	animation_state_update :: proc(self: AnimationState, delta: c.float) ---
	animation_state_apply :: proc(self: AnimationState, skeleton: Skeleton) -> c.bool ---
	animation_state_clear_tracks :: proc(self: AnimationState) ---
	animation_state_clear_track :: proc(self: AnimationState, track_index: c.size_t) ---
	animation_state_set_animation_1 :: proc(self: AnimationState, track_index: c.size_t, animation_name: cstring, loop: c.bool) -> TrackEntry ---
	animation_state_set_animation_2 :: proc(self: AnimationState, track_index: c.size_t, animation: Animation, loop: c.bool) -> TrackEntry ---
	animation_state_add_animation_1 :: proc(self: AnimationState, track_index: c.size_t, animation_name: cstring, loop: c.bool, delay: c.float) -> TrackEntry ---
	animation_state_add_animation_2 :: proc(self: AnimationState, track_index: c.size_t, animation: Animation, loop: c.bool, delay: c.float) -> TrackEntry ---
	animation_state_set_empty_animation :: proc(self: AnimationState, track_index: c.size_t, mix_duration: c.float) -> TrackEntry ---
	animation_state_add_empty_animation :: proc(self: AnimationState, track_index: c.size_t, mix_duration: c.float, delay: c.float) -> TrackEntry ---
	animation_state_set_empty_animations :: proc(self: AnimationState, mix_duration: c.float) ---
	animation_state_get_track :: proc(self: AnimationState, track_index: c.size_t) -> TrackEntry ---
	animation_state_get_data :: proc(self: AnimationState) -> AnimationStateData ---
	animation_state_get_tracks :: proc(self: AnimationState) -> ArrayTrackEntry ---
	animation_state_get_time_scale :: proc(self: AnimationState) -> c.float ---
	animation_state_set_time_scale :: proc(self: AnimationState, in_value: c.float) ---
	animation_state_disable_queue :: proc(self: AnimationState) ---
	animation_state_enable_queue :: proc(self: AnimationState) ---
	animation_state_set_manual_track_entry_disposal :: proc(self: AnimationState, in_value: c.bool) ---
	animation_state_get_manual_track_entry_disposal :: proc(self: AnimationState) -> c.bool ---
	animation_state_dispose_track_entry :: proc(self: AnimationState, entry: TrackEntry) ---
	animation_state_get_renderer_object :: proc(self: AnimationState) -> rawptr ---
	animation_state_data_create :: proc(skeleton_data: SkeletonData) -> AnimationStateData ---
	animation_state_data_dispose :: proc(self: AnimationStateData) ---
	animation_state_data_get_skeleton_data :: proc(self: AnimationStateData) -> SkeletonData ---
	animation_state_data_get_default_mix :: proc(self: AnimationStateData) -> c.float ---
	animation_state_data_set_default_mix :: proc(self: AnimationStateData, in_value: c.float) ---
	animation_state_data_set_mix_1 :: proc(self: AnimationStateData, from_name: cstring, to_name: cstring, duration: c.float) ---
	animation_state_data_set_mix_2 :: proc(self: AnimationStateData, from: Animation, to: Animation, duration: c.float) ---
	animation_state_data_get_mix :: proc(self: AnimationStateData, from: Animation, to: Animation) -> c.float ---
	animation_state_data_clear :: proc(self: AnimationStateData) ---
	array_float_create :: proc() -> ArrayFloat ---
	array_float_create_with_capacity :: proc(initial_capacity: c.size_t) -> ArrayFloat ---
	array_float_dispose :: proc(array: ArrayFloat) ---
	array_float_clear :: proc(array: ArrayFloat) ---
	array_float_get_capacity :: proc(array: ArrayFloat) -> c.size_t ---
	array_float_size :: proc(array: ArrayFloat) -> c.size_t ---
	array_float_set_size :: proc(array: ArrayFloat, new_size: c.size_t, default_value: c.float) -> ArrayFloat ---
	array_float_ensure_capacity :: proc(array: ArrayFloat, new_capacity: c.size_t) ---
	array_float_add :: proc(array: ArrayFloat, in_value: c.float) ---
	array_float_add_all :: proc(array: ArrayFloat, in_value: ArrayFloat) ---
	array_float_clear_and_add_all :: proc(array: ArrayFloat, in_value: ArrayFloat) ---
	array_float_remove_at :: proc(array: ArrayFloat, in_index: c.size_t) ---
	array_float_contains :: proc(array: ArrayFloat, in_value: c.float) -> c.bool ---
	array_float_index_of :: proc(array: ArrayFloat, in_value: c.float) -> c.int ---
	array_float_buffer :: proc(array: ArrayFloat) -> [^]c.float ---
	array_int_create :: proc() -> ArrayInt ---
	array_int_create_with_capacity :: proc(initial_capacity: c.size_t) -> ArrayInt ---
	array_int_dispose :: proc(array: ArrayInt) ---
	array_int_clear :: proc(array: ArrayInt) ---
	array_int_get_capacity :: proc(array: ArrayInt) -> c.size_t ---
	array_int_size :: proc(array: ArrayInt) -> c.size_t ---
	array_int_set_size :: proc(array: ArrayInt, new_size: c.size_t, default_value: c.int) -> ArrayInt ---
	array_int_ensure_capacity :: proc(array: ArrayInt, new_capacity: c.size_t) ---
	array_int_add :: proc(array: ArrayInt, in_value: c.int) ---
	array_int_add_all :: proc(array: ArrayInt, in_value: ArrayInt) ---
	array_int_clear_and_add_all :: proc(array: ArrayInt, in_value: ArrayInt) ---
	array_int_remove_at :: proc(array: ArrayInt, in_index: c.size_t) ---
	array_int_contains :: proc(array: ArrayInt, in_value: c.int) -> c.bool ---
	array_int_index_of :: proc(array: ArrayInt, in_value: c.int) -> c.int ---
	array_int_buffer :: proc(array: ArrayInt) -> [^]c.int ---
	array_unsigned_short_create :: proc() -> ArrayUnsignedShort ---
	array_unsigned_short_create_with_capacity :: proc(initial_capacity: c.size_t) -> ArrayUnsignedShort ---
	array_unsigned_short_dispose :: proc(array: ArrayUnsignedShort) ---
	array_unsigned_short_clear :: proc(array: ArrayUnsignedShort) ---
	array_unsigned_short_get_capacity :: proc(array: ArrayUnsignedShort) -> c.size_t ---
	array_unsigned_short_size :: proc(array: ArrayUnsignedShort) -> c.size_t ---
	array_unsigned_short_set_size :: proc(array: ArrayUnsignedShort, new_size: c.size_t, default_value: c.ushort) -> ArrayUnsignedShort ---
	array_unsigned_short_ensure_capacity :: proc(array: ArrayUnsignedShort, new_capacity: c.size_t) ---
	array_unsigned_short_add :: proc(array: ArrayUnsignedShort, in_value: c.ushort) ---
	array_unsigned_short_add_all :: proc(array: ArrayUnsignedShort, in_value: ArrayUnsignedShort) ---
	array_unsigned_short_clear_and_add_all :: proc(array: ArrayUnsignedShort, in_value: ArrayUnsignedShort) ---
	array_unsigned_short_remove_at :: proc(array: ArrayUnsignedShort, in_index: c.size_t) ---
	array_unsigned_short_contains :: proc(array: ArrayUnsignedShort, in_value: c.ushort) -> c.bool ---
	array_unsigned_short_index_of :: proc(array: ArrayUnsignedShort, in_value: c.ushort) -> c.int ---
	array_unsigned_short_buffer :: proc(array: ArrayUnsignedShort) -> [^]c.ushort ---
	array_property_id_create :: proc() -> ArrayPropertyId ---
	array_property_id_create_with_capacity :: proc(initial_capacity: c.size_t) -> ArrayPropertyId ---
	array_property_id_dispose :: proc(array: ArrayPropertyId) ---
	array_property_id_clear :: proc(array: ArrayPropertyId) ---
	array_property_id_get_capacity :: proc(array: ArrayPropertyId) -> c.size_t ---
	array_property_id_size :: proc(array: ArrayPropertyId) -> c.size_t ---
	array_property_id_set_size :: proc(array: ArrayPropertyId, new_size: c.size_t, default_value: c.int64_t) -> ArrayPropertyId ---
	array_property_id_ensure_capacity :: proc(array: ArrayPropertyId, new_capacity: c.size_t) ---
	array_property_id_add :: proc(array: ArrayPropertyId, in_value: c.int64_t) ---
	array_property_id_add_all :: proc(array: ArrayPropertyId, in_value: ArrayPropertyId) ---
	array_property_id_clear_and_add_all :: proc(array: ArrayPropertyId, in_value: ArrayPropertyId) ---
	array_property_id_remove_at :: proc(array: ArrayPropertyId, in_index: c.size_t) ---
	array_property_id_contains :: proc(array: ArrayPropertyId, in_value: c.int64_t) -> c.bool ---
	array_property_id_index_of :: proc(array: ArrayPropertyId, in_value: c.int64_t) -> c.int ---
	array_property_id_buffer :: proc(array: ArrayPropertyId) -> [^]c.int64_t ---
	array_animation_create :: proc() -> ArrayAnimation ---
	array_animation_create_with_capacity :: proc(initial_capacity: c.size_t) -> ArrayAnimation ---
	array_animation_dispose :: proc(array: ArrayAnimation) ---
	array_animation_clear :: proc(array: ArrayAnimation) ---
	array_animation_get_capacity :: proc(array: ArrayAnimation) -> c.size_t ---
	array_animation_size :: proc(array: ArrayAnimation) -> c.size_t ---
	array_animation_set_size :: proc(array: ArrayAnimation, new_size: c.size_t, default_value: Animation) -> ArrayAnimation ---
	array_animation_ensure_capacity :: proc(array: ArrayAnimation, new_capacity: c.size_t) ---
	array_animation_add :: proc(array: ArrayAnimation, in_value: Animation) ---
	array_animation_add_all :: proc(array: ArrayAnimation, in_value: ArrayAnimation) ---
	array_animation_clear_and_add_all :: proc(array: ArrayAnimation, in_value: ArrayAnimation) ---
	array_animation_remove_at :: proc(array: ArrayAnimation, in_index: c.size_t) ---
	array_animation_contains :: proc(array: ArrayAnimation, in_value: Animation) -> c.bool ---
	array_animation_index_of :: proc(array: ArrayAnimation, in_value: Animation) -> c.int ---
	array_animation_buffer :: proc(array: ArrayAnimation) -> [^]Animation ---
	array_atlas_page_create :: proc() -> ArrayAtlasPage ---
	array_atlas_page_create_with_capacity :: proc(initial_capacity: c.size_t) -> ArrayAtlasPage ---
	array_atlas_page_dispose :: proc(array: ArrayAtlasPage) ---
	array_atlas_page_clear :: proc(array: ArrayAtlasPage) ---
	array_atlas_page_get_capacity :: proc(array: ArrayAtlasPage) -> c.size_t ---
	array_atlas_page_size :: proc(array: ArrayAtlasPage) -> c.size_t ---
	array_atlas_page_set_size :: proc(array: ArrayAtlasPage, new_size: c.size_t, default_value: AtlasPage) -> ArrayAtlasPage ---
	array_atlas_page_ensure_capacity :: proc(array: ArrayAtlasPage, new_capacity: c.size_t) ---
	array_atlas_page_add :: proc(array: ArrayAtlasPage, in_value: AtlasPage) ---
	array_atlas_page_add_all :: proc(array: ArrayAtlasPage, in_value: ArrayAtlasPage) ---
	array_atlas_page_clear_and_add_all :: proc(array: ArrayAtlasPage, in_value: ArrayAtlasPage) ---
	array_atlas_page_remove_at :: proc(array: ArrayAtlasPage, in_index: c.size_t) ---
	array_atlas_page_contains :: proc(array: ArrayAtlasPage, in_value: AtlasPage) -> c.bool ---
	array_atlas_page_index_of :: proc(array: ArrayAtlasPage, in_value: AtlasPage) -> c.int ---
	array_atlas_page_buffer :: proc(array: ArrayAtlasPage) -> [^]AtlasPage ---
	array_atlas_region_create :: proc() -> ArrayAtlasRegion ---
	array_atlas_region_create_with_capacity :: proc(initial_capacity: c.size_t) -> ArrayAtlasRegion ---
	array_atlas_region_dispose :: proc(array: ArrayAtlasRegion) ---
	array_atlas_region_clear :: proc(array: ArrayAtlasRegion) ---
	array_atlas_region_get_capacity :: proc(array: ArrayAtlasRegion) -> c.size_t ---
	array_atlas_region_size :: proc(array: ArrayAtlasRegion) -> c.size_t ---
	array_atlas_region_set_size :: proc(array: ArrayAtlasRegion, new_size: c.size_t, default_value: AtlasRegion) -> ArrayAtlasRegion ---
	array_atlas_region_ensure_capacity :: proc(array: ArrayAtlasRegion, new_capacity: c.size_t) ---
	array_atlas_region_add :: proc(array: ArrayAtlasRegion, in_value: AtlasRegion) ---
	array_atlas_region_add_all :: proc(array: ArrayAtlasRegion, in_value: ArrayAtlasRegion) ---
	array_atlas_region_clear_and_add_all :: proc(array: ArrayAtlasRegion, in_value: ArrayAtlasRegion) ---
	array_atlas_region_remove_at :: proc(array: ArrayAtlasRegion, in_index: c.size_t) ---
	array_atlas_region_contains :: proc(array: ArrayAtlasRegion, in_value: AtlasRegion) -> c.bool ---
	array_atlas_region_index_of :: proc(array: ArrayAtlasRegion, in_value: AtlasRegion) -> c.int ---
	array_atlas_region_buffer :: proc(array: ArrayAtlasRegion) -> [^]AtlasRegion ---
	array_attachment_create :: proc() -> ArrayAttachment ---
	array_attachment_create_with_capacity :: proc(initial_capacity: c.size_t) -> ArrayAttachment ---
	array_attachment_dispose :: proc(array: ArrayAttachment) ---
	array_attachment_clear :: proc(array: ArrayAttachment) ---
	array_attachment_get_capacity :: proc(array: ArrayAttachment) -> c.size_t ---
	array_attachment_size :: proc(array: ArrayAttachment) -> c.size_t ---
	array_attachment_set_size :: proc(array: ArrayAttachment, new_size: c.size_t, default_value: Attachment) -> ArrayAttachment ---
	array_attachment_ensure_capacity :: proc(array: ArrayAttachment, new_capacity: c.size_t) ---
	array_attachment_add :: proc(array: ArrayAttachment, in_value: Attachment) ---
	array_attachment_add_all :: proc(array: ArrayAttachment, in_value: ArrayAttachment) ---
	array_attachment_clear_and_add_all :: proc(array: ArrayAttachment, in_value: ArrayAttachment) ---
	array_attachment_remove_at :: proc(array: ArrayAttachment, in_index: c.size_t) ---
	array_attachment_contains :: proc(array: ArrayAttachment, in_value: Attachment) -> c.bool ---
	array_attachment_index_of :: proc(array: ArrayAttachment, in_value: Attachment) -> c.int ---
	array_attachment_buffer :: proc(array: ArrayAttachment) -> [^]Attachment ---
	array_bone_create :: proc() -> ArrayBone ---
	array_bone_create_with_capacity :: proc(initial_capacity: c.size_t) -> ArrayBone ---
	array_bone_dispose :: proc(array: ArrayBone) ---
	array_bone_clear :: proc(array: ArrayBone) ---
	array_bone_get_capacity :: proc(array: ArrayBone) -> c.size_t ---
	array_bone_size :: proc(array: ArrayBone) -> c.size_t ---
	array_bone_set_size :: proc(array: ArrayBone, new_size: c.size_t, default_value: Bone) -> ArrayBone ---
	array_bone_ensure_capacity :: proc(array: ArrayBone, new_capacity: c.size_t) ---
	array_bone_add :: proc(array: ArrayBone, in_value: Bone) ---
	array_bone_add_all :: proc(array: ArrayBone, in_value: ArrayBone) ---
	array_bone_clear_and_add_all :: proc(array: ArrayBone, in_value: ArrayBone) ---
	array_bone_remove_at :: proc(array: ArrayBone, in_index: c.size_t) ---
	array_bone_contains :: proc(array: ArrayBone, in_value: Bone) -> c.bool ---
	array_bone_index_of :: proc(array: ArrayBone, in_value: Bone) -> c.int ---
	array_bone_buffer :: proc(array: ArrayBone) -> [^]Bone ---
	array_bone_data_create :: proc() -> ArrayBoneData ---
	array_bone_data_create_with_capacity :: proc(initial_capacity: c.size_t) -> ArrayBoneData ---
	array_bone_data_dispose :: proc(array: ArrayBoneData) ---
	array_bone_data_clear :: proc(array: ArrayBoneData) ---
	array_bone_data_get_capacity :: proc(array: ArrayBoneData) -> c.size_t ---
	array_bone_data_size :: proc(array: ArrayBoneData) -> c.size_t ---
	array_bone_data_set_size :: proc(array: ArrayBoneData, new_size: c.size_t, default_value: BoneData) -> ArrayBoneData ---
	array_bone_data_ensure_capacity :: proc(array: ArrayBoneData, new_capacity: c.size_t) ---
	array_bone_data_add :: proc(array: ArrayBoneData, in_value: BoneData) ---
	array_bone_data_add_all :: proc(array: ArrayBoneData, in_value: ArrayBoneData) ---
	array_bone_data_clear_and_add_all :: proc(array: ArrayBoneData, in_value: ArrayBoneData) ---
	array_bone_data_remove_at :: proc(array: ArrayBoneData, in_index: c.size_t) ---
	array_bone_data_contains :: proc(array: ArrayBoneData, in_value: BoneData) -> c.bool ---
	array_bone_data_index_of :: proc(array: ArrayBoneData, in_value: BoneData) -> c.int ---
	array_bone_data_buffer :: proc(array: ArrayBoneData) -> [^]BoneData ---
	array_bone_pose_create :: proc() -> ArrayBonePose ---
	array_bone_pose_create_with_capacity :: proc(initial_capacity: c.size_t) -> ArrayBonePose ---
	array_bone_pose_dispose :: proc(array: ArrayBonePose) ---
	array_bone_pose_clear :: proc(array: ArrayBonePose) ---
	array_bone_pose_get_capacity :: proc(array: ArrayBonePose) -> c.size_t ---
	array_bone_pose_size :: proc(array: ArrayBonePose) -> c.size_t ---
	array_bone_pose_set_size :: proc(array: ArrayBonePose, new_size: c.size_t, default_value: BonePose) -> ArrayBonePose ---
	array_bone_pose_ensure_capacity :: proc(array: ArrayBonePose, new_capacity: c.size_t) ---
	array_bone_pose_add :: proc(array: ArrayBonePose, in_value: BonePose) ---
	array_bone_pose_add_all :: proc(array: ArrayBonePose, in_value: ArrayBonePose) ---
	array_bone_pose_clear_and_add_all :: proc(array: ArrayBonePose, in_value: ArrayBonePose) ---
	array_bone_pose_remove_at :: proc(array: ArrayBonePose, in_index: c.size_t) ---
	array_bone_pose_contains :: proc(array: ArrayBonePose, in_value: BonePose) -> c.bool ---
	array_bone_pose_index_of :: proc(array: ArrayBonePose, in_value: BonePose) -> c.int ---
	array_bone_pose_buffer :: proc(array: ArrayBonePose) -> [^]BonePose ---
	array_bounding_box_attachment_create :: proc() -> ArrayBoundingBoxAttachment ---
	array_bounding_box_attachment_create_with_capacity :: proc(initial_capacity: c.size_t) -> ArrayBoundingBoxAttachment ---
	array_bounding_box_attachment_dispose :: proc(array: ArrayBoundingBoxAttachment) ---
	array_bounding_box_attachment_clear :: proc(array: ArrayBoundingBoxAttachment) ---
	array_bounding_box_attachment_get_capacity :: proc(array: ArrayBoundingBoxAttachment) -> c.size_t ---
	array_bounding_box_attachment_size :: proc(array: ArrayBoundingBoxAttachment) -> c.size_t ---
	array_bounding_box_attachment_set_size :: proc(array: ArrayBoundingBoxAttachment, new_size: c.size_t, default_value: BoundingBoxAttachment) -> ArrayBoundingBoxAttachment ---
	array_bounding_box_attachment_ensure_capacity :: proc(array: ArrayBoundingBoxAttachment, new_capacity: c.size_t) ---
	array_bounding_box_attachment_add :: proc(array: ArrayBoundingBoxAttachment, in_value: BoundingBoxAttachment) ---
	array_bounding_box_attachment_add_all :: proc(array: ArrayBoundingBoxAttachment, in_value: ArrayBoundingBoxAttachment) ---
	array_bounding_box_attachment_clear_and_add_all :: proc(array: ArrayBoundingBoxAttachment, in_value: ArrayBoundingBoxAttachment) ---
	array_bounding_box_attachment_remove_at :: proc(array: ArrayBoundingBoxAttachment, in_index: c.size_t) ---
	array_bounding_box_attachment_contains :: proc(array: ArrayBoundingBoxAttachment, in_value: BoundingBoxAttachment) -> c.bool ---
	array_bounding_box_attachment_index_of :: proc(array: ArrayBoundingBoxAttachment, in_value: BoundingBoxAttachment) -> c.int ---
	array_bounding_box_attachment_buffer :: proc(array: ArrayBoundingBoxAttachment) -> [^]BoundingBoxAttachment ---
	array_constraint_create :: proc() -> ArrayConstraint ---
	array_constraint_create_with_capacity :: proc(initial_capacity: c.size_t) -> ArrayConstraint ---
	array_constraint_dispose :: proc(array: ArrayConstraint) ---
	array_constraint_clear :: proc(array: ArrayConstraint) ---
	array_constraint_get_capacity :: proc(array: ArrayConstraint) -> c.size_t ---
	array_constraint_size :: proc(array: ArrayConstraint) -> c.size_t ---
	array_constraint_set_size :: proc(array: ArrayConstraint, new_size: c.size_t, default_value: Constraint) -> ArrayConstraint ---
	array_constraint_ensure_capacity :: proc(array: ArrayConstraint, new_capacity: c.size_t) ---
	array_constraint_add :: proc(array: ArrayConstraint, in_value: Constraint) ---
	array_constraint_add_all :: proc(array: ArrayConstraint, in_value: ArrayConstraint) ---
	array_constraint_clear_and_add_all :: proc(array: ArrayConstraint, in_value: ArrayConstraint) ---
	array_constraint_remove_at :: proc(array: ArrayConstraint, in_index: c.size_t) ---
	array_constraint_contains :: proc(array: ArrayConstraint, in_value: Constraint) -> c.bool ---
	array_constraint_index_of :: proc(array: ArrayConstraint, in_value: Constraint) -> c.int ---
	array_constraint_buffer :: proc(array: ArrayConstraint) -> [^]Constraint ---
	array_constraint_data_create :: proc() -> ArrayConstraintData ---
	array_constraint_data_create_with_capacity :: proc(initial_capacity: c.size_t) -> ArrayConstraintData ---
	array_constraint_data_dispose :: proc(array: ArrayConstraintData) ---
	array_constraint_data_clear :: proc(array: ArrayConstraintData) ---
	array_constraint_data_get_capacity :: proc(array: ArrayConstraintData) -> c.size_t ---
	array_constraint_data_size :: proc(array: ArrayConstraintData) -> c.size_t ---
	array_constraint_data_set_size :: proc(array: ArrayConstraintData, new_size: c.size_t, default_value: ConstraintData) -> ArrayConstraintData ---
	array_constraint_data_ensure_capacity :: proc(array: ArrayConstraintData, new_capacity: c.size_t) ---
	array_constraint_data_add :: proc(array: ArrayConstraintData, in_value: ConstraintData) ---
	array_constraint_data_add_all :: proc(array: ArrayConstraintData, in_value: ArrayConstraintData) ---
	array_constraint_data_clear_and_add_all :: proc(array: ArrayConstraintData, in_value: ArrayConstraintData) ---
	array_constraint_data_remove_at :: proc(array: ArrayConstraintData, in_index: c.size_t) ---
	array_constraint_data_contains :: proc(array: ArrayConstraintData, in_value: ConstraintData) -> c.bool ---
	array_constraint_data_index_of :: proc(array: ArrayConstraintData, in_value: ConstraintData) -> c.int ---
	array_constraint_data_buffer :: proc(array: ArrayConstraintData) -> [^]ConstraintData ---
	array_event_create :: proc() -> ArrayEvent ---
	array_event_create_with_capacity :: proc(initial_capacity: c.size_t) -> ArrayEvent ---
	array_event_dispose :: proc(array: ArrayEvent) ---
	array_event_clear :: proc(array: ArrayEvent) ---
	array_event_get_capacity :: proc(array: ArrayEvent) -> c.size_t ---
	array_event_size :: proc(array: ArrayEvent) -> c.size_t ---
	array_event_set_size :: proc(array: ArrayEvent, new_size: c.size_t, default_value: Event) -> ArrayEvent ---
	array_event_ensure_capacity :: proc(array: ArrayEvent, new_capacity: c.size_t) ---
	array_event_add :: proc(array: ArrayEvent, in_value: Event) ---
	array_event_add_all :: proc(array: ArrayEvent, in_value: ArrayEvent) ---
	array_event_clear_and_add_all :: proc(array: ArrayEvent, in_value: ArrayEvent) ---
	array_event_remove_at :: proc(array: ArrayEvent, in_index: c.size_t) ---
	array_event_contains :: proc(array: ArrayEvent, in_value: Event) -> c.bool ---
	array_event_index_of :: proc(array: ArrayEvent, in_value: Event) -> c.int ---
	array_event_buffer :: proc(array: ArrayEvent) -> [^]Event ---
	array_event_data_create :: proc() -> ArrayEventData ---
	array_event_data_create_with_capacity :: proc(initial_capacity: c.size_t) -> ArrayEventData ---
	array_event_data_dispose :: proc(array: ArrayEventData) ---
	array_event_data_clear :: proc(array: ArrayEventData) ---
	array_event_data_get_capacity :: proc(array: ArrayEventData) -> c.size_t ---
	array_event_data_size :: proc(array: ArrayEventData) -> c.size_t ---
	array_event_data_set_size :: proc(array: ArrayEventData, new_size: c.size_t, default_value: EventData) -> ArrayEventData ---
	array_event_data_ensure_capacity :: proc(array: ArrayEventData, new_capacity: c.size_t) ---
	array_event_data_add :: proc(array: ArrayEventData, in_value: EventData) ---
	array_event_data_add_all :: proc(array: ArrayEventData, in_value: ArrayEventData) ---
	array_event_data_clear_and_add_all :: proc(array: ArrayEventData, in_value: ArrayEventData) ---
	array_event_data_remove_at :: proc(array: ArrayEventData, in_index: c.size_t) ---
	array_event_data_contains :: proc(array: ArrayEventData, in_value: EventData) -> c.bool ---
	array_event_data_index_of :: proc(array: ArrayEventData, in_value: EventData) -> c.int ---
	array_event_data_buffer :: proc(array: ArrayEventData) -> [^]EventData ---
	array_from_property_create :: proc() -> ArrayFromProperty ---
	array_from_property_create_with_capacity :: proc(initial_capacity: c.size_t) -> ArrayFromProperty ---
	array_from_property_dispose :: proc(array: ArrayFromProperty) ---
	array_from_property_clear :: proc(array: ArrayFromProperty) ---
	array_from_property_get_capacity :: proc(array: ArrayFromProperty) -> c.size_t ---
	array_from_property_size :: proc(array: ArrayFromProperty) -> c.size_t ---
	array_from_property_set_size :: proc(array: ArrayFromProperty, new_size: c.size_t, default_value: FromProperty) -> ArrayFromProperty ---
	array_from_property_ensure_capacity :: proc(array: ArrayFromProperty, new_capacity: c.size_t) ---
	array_from_property_add :: proc(array: ArrayFromProperty, in_value: FromProperty) ---
	array_from_property_add_all :: proc(array: ArrayFromProperty, in_value: ArrayFromProperty) ---
	array_from_property_clear_and_add_all :: proc(array: ArrayFromProperty, in_value: ArrayFromProperty) ---
	array_from_property_remove_at :: proc(array: ArrayFromProperty, in_index: c.size_t) ---
	array_from_property_contains :: proc(array: ArrayFromProperty, in_value: FromProperty) -> c.bool ---
	array_from_property_index_of :: proc(array: ArrayFromProperty, in_value: FromProperty) -> c.int ---
	array_from_property_buffer :: proc(array: ArrayFromProperty) -> [^]FromProperty ---
	array_physics_constraint_create :: proc() -> ArrayPhysicsConstraint ---
	array_physics_constraint_create_with_capacity :: proc(initial_capacity: c.size_t) -> ArrayPhysicsConstraint ---
	array_physics_constraint_dispose :: proc(array: ArrayPhysicsConstraint) ---
	array_physics_constraint_clear :: proc(array: ArrayPhysicsConstraint) ---
	array_physics_constraint_get_capacity :: proc(array: ArrayPhysicsConstraint) -> c.size_t ---
	array_physics_constraint_size :: proc(array: ArrayPhysicsConstraint) -> c.size_t ---
	array_physics_constraint_set_size :: proc(array: ArrayPhysicsConstraint, new_size: c.size_t, default_value: PhysicsConstraint) -> ArrayPhysicsConstraint ---
	array_physics_constraint_ensure_capacity :: proc(array: ArrayPhysicsConstraint, new_capacity: c.size_t) ---
	array_physics_constraint_add :: proc(array: ArrayPhysicsConstraint, in_value: PhysicsConstraint) ---
	array_physics_constraint_add_all :: proc(array: ArrayPhysicsConstraint, in_value: ArrayPhysicsConstraint) ---
	array_physics_constraint_clear_and_add_all :: proc(array: ArrayPhysicsConstraint, in_value: ArrayPhysicsConstraint) ---
	array_physics_constraint_remove_at :: proc(array: ArrayPhysicsConstraint, in_index: c.size_t) ---
	array_physics_constraint_contains :: proc(array: ArrayPhysicsConstraint, in_value: PhysicsConstraint) -> c.bool ---
	array_physics_constraint_index_of :: proc(array: ArrayPhysicsConstraint, in_value: PhysicsConstraint) -> c.int ---
	array_physics_constraint_buffer :: proc(array: ArrayPhysicsConstraint) -> [^]PhysicsConstraint ---
	array_polygon_create :: proc() -> ArrayPolygon ---
	array_polygon_create_with_capacity :: proc(initial_capacity: c.size_t) -> ArrayPolygon ---
	array_polygon_dispose :: proc(array: ArrayPolygon) ---
	array_polygon_clear :: proc(array: ArrayPolygon) ---
	array_polygon_get_capacity :: proc(array: ArrayPolygon) -> c.size_t ---
	array_polygon_size :: proc(array: ArrayPolygon) -> c.size_t ---
	array_polygon_set_size :: proc(array: ArrayPolygon, new_size: c.size_t, default_value: Polygon) -> ArrayPolygon ---
	array_polygon_ensure_capacity :: proc(array: ArrayPolygon, new_capacity: c.size_t) ---
	array_polygon_add :: proc(array: ArrayPolygon, in_value: Polygon) ---
	array_polygon_add_all :: proc(array: ArrayPolygon, in_value: ArrayPolygon) ---
	array_polygon_clear_and_add_all :: proc(array: ArrayPolygon, in_value: ArrayPolygon) ---
	array_polygon_remove_at :: proc(array: ArrayPolygon, in_index: c.size_t) ---
	array_polygon_contains :: proc(array: ArrayPolygon, in_value: Polygon) -> c.bool ---
	array_polygon_index_of :: proc(array: ArrayPolygon, in_value: Polygon) -> c.int ---
	array_polygon_buffer :: proc(array: ArrayPolygon) -> [^]Polygon ---
	array_skin_create :: proc() -> ArraySkin ---
	array_skin_create_with_capacity :: proc(initial_capacity: c.size_t) -> ArraySkin ---
	array_skin_dispose :: proc(array: ArraySkin) ---
	array_skin_clear :: proc(array: ArraySkin) ---
	array_skin_get_capacity :: proc(array: ArraySkin) -> c.size_t ---
	array_skin_size :: proc(array: ArraySkin) -> c.size_t ---
	array_skin_set_size :: proc(array: ArraySkin, new_size: c.size_t, default_value: Skin) -> ArraySkin ---
	array_skin_ensure_capacity :: proc(array: ArraySkin, new_capacity: c.size_t) ---
	array_skin_add :: proc(array: ArraySkin, in_value: Skin) ---
	array_skin_add_all :: proc(array: ArraySkin, in_value: ArraySkin) ---
	array_skin_clear_and_add_all :: proc(array: ArraySkin, in_value: ArraySkin) ---
	array_skin_remove_at :: proc(array: ArraySkin, in_index: c.size_t) ---
	array_skin_contains :: proc(array: ArraySkin, in_value: Skin) -> c.bool ---
	array_skin_index_of :: proc(array: ArraySkin, in_value: Skin) -> c.int ---
	array_skin_buffer :: proc(array: ArraySkin) -> [^]Skin ---
	array_slot_create :: proc() -> ArraySlot ---
	array_slot_create_with_capacity :: proc(initial_capacity: c.size_t) -> ArraySlot ---
	array_slot_dispose :: proc(array: ArraySlot) ---
	array_slot_clear :: proc(array: ArraySlot) ---
	array_slot_get_capacity :: proc(array: ArraySlot) -> c.size_t ---
	array_slot_size :: proc(array: ArraySlot) -> c.size_t ---
	array_slot_set_size :: proc(array: ArraySlot, new_size: c.size_t, default_value: Slot) -> ArraySlot ---
	array_slot_ensure_capacity :: proc(array: ArraySlot, new_capacity: c.size_t) ---
	array_slot_add :: proc(array: ArraySlot, in_value: Slot) ---
	array_slot_add_all :: proc(array: ArraySlot, in_value: ArraySlot) ---
	array_slot_clear_and_add_all :: proc(array: ArraySlot, in_value: ArraySlot) ---
	array_slot_remove_at :: proc(array: ArraySlot, in_index: c.size_t) ---
	array_slot_contains :: proc(array: ArraySlot, in_value: Slot) -> c.bool ---
	array_slot_index_of :: proc(array: ArraySlot, in_value: Slot) -> c.int ---
	array_slot_buffer :: proc(array: ArraySlot) -> [^]Slot ---
	array_slot_data_create :: proc() -> ArraySlotData ---
	array_slot_data_create_with_capacity :: proc(initial_capacity: c.size_t) -> ArraySlotData ---
	array_slot_data_dispose :: proc(array: ArraySlotData) ---
	array_slot_data_clear :: proc(array: ArraySlotData) ---
	array_slot_data_get_capacity :: proc(array: ArraySlotData) -> c.size_t ---
	array_slot_data_size :: proc(array: ArraySlotData) -> c.size_t ---
	array_slot_data_set_size :: proc(array: ArraySlotData, new_size: c.size_t, default_value: SlotData) -> ArraySlotData ---
	array_slot_data_ensure_capacity :: proc(array: ArraySlotData, new_capacity: c.size_t) ---
	array_slot_data_add :: proc(array: ArraySlotData, in_value: SlotData) ---
	array_slot_data_add_all :: proc(array: ArraySlotData, in_value: ArraySlotData) ---
	array_slot_data_clear_and_add_all :: proc(array: ArraySlotData, in_value: ArraySlotData) ---
	array_slot_data_remove_at :: proc(array: ArraySlotData, in_index: c.size_t) ---
	array_slot_data_contains :: proc(array: ArraySlotData, in_value: SlotData) -> c.bool ---
	array_slot_data_index_of :: proc(array: ArraySlotData, in_value: SlotData) -> c.int ---
	array_slot_data_buffer :: proc(array: ArraySlotData) -> [^]SlotData ---
	array_texture_region_create :: proc() -> ArrayTextureRegion ---
	array_texture_region_create_with_capacity :: proc(initial_capacity: c.size_t) -> ArrayTextureRegion ---
	array_texture_region_dispose :: proc(array: ArrayTextureRegion) ---
	array_texture_region_clear :: proc(array: ArrayTextureRegion) ---
	array_texture_region_get_capacity :: proc(array: ArrayTextureRegion) -> c.size_t ---
	array_texture_region_size :: proc(array: ArrayTextureRegion) -> c.size_t ---
	array_texture_region_set_size :: proc(array: ArrayTextureRegion, new_size: c.size_t, default_value: TextureRegion) -> ArrayTextureRegion ---
	array_texture_region_ensure_capacity :: proc(array: ArrayTextureRegion, new_capacity: c.size_t) ---
	array_texture_region_add :: proc(array: ArrayTextureRegion, in_value: TextureRegion) ---
	array_texture_region_add_all :: proc(array: ArrayTextureRegion, in_value: ArrayTextureRegion) ---
	array_texture_region_clear_and_add_all :: proc(array: ArrayTextureRegion, in_value: ArrayTextureRegion) ---
	array_texture_region_remove_at :: proc(array: ArrayTextureRegion, in_index: c.size_t) ---
	array_texture_region_contains :: proc(array: ArrayTextureRegion, in_value: TextureRegion) -> c.bool ---
	array_texture_region_index_of :: proc(array: ArrayTextureRegion, in_value: TextureRegion) -> c.int ---
	array_texture_region_buffer :: proc(array: ArrayTextureRegion) -> [^]TextureRegion ---
	array_timeline_create :: proc() -> ArrayTimeline ---
	array_timeline_create_with_capacity :: proc(initial_capacity: c.size_t) -> ArrayTimeline ---
	array_timeline_dispose :: proc(array: ArrayTimeline) ---
	array_timeline_clear :: proc(array: ArrayTimeline) ---
	array_timeline_get_capacity :: proc(array: ArrayTimeline) -> c.size_t ---
	array_timeline_size :: proc(array: ArrayTimeline) -> c.size_t ---
	array_timeline_set_size :: proc(array: ArrayTimeline, new_size: c.size_t, default_value: Timeline) -> ArrayTimeline ---
	array_timeline_ensure_capacity :: proc(array: ArrayTimeline, new_capacity: c.size_t) ---
	array_timeline_add :: proc(array: ArrayTimeline, in_value: Timeline) ---
	array_timeline_add_all :: proc(array: ArrayTimeline, in_value: ArrayTimeline) ---
	array_timeline_clear_and_add_all :: proc(array: ArrayTimeline, in_value: ArrayTimeline) ---
	array_timeline_remove_at :: proc(array: ArrayTimeline, in_index: c.size_t) ---
	array_timeline_contains :: proc(array: ArrayTimeline, in_value: Timeline) -> c.bool ---
	array_timeline_index_of :: proc(array: ArrayTimeline, in_value: Timeline) -> c.int ---
	array_timeline_buffer :: proc(array: ArrayTimeline) -> [^]Timeline ---
	array_to_property_create :: proc() -> ArrayToProperty ---
	array_to_property_create_with_capacity :: proc(initial_capacity: c.size_t) -> ArrayToProperty ---
	array_to_property_dispose :: proc(array: ArrayToProperty) ---
	array_to_property_clear :: proc(array: ArrayToProperty) ---
	array_to_property_get_capacity :: proc(array: ArrayToProperty) -> c.size_t ---
	array_to_property_size :: proc(array: ArrayToProperty) -> c.size_t ---
	array_to_property_set_size :: proc(array: ArrayToProperty, new_size: c.size_t, default_value: ToProperty) -> ArrayToProperty ---
	array_to_property_ensure_capacity :: proc(array: ArrayToProperty, new_capacity: c.size_t) ---
	array_to_property_add :: proc(array: ArrayToProperty, in_value: ToProperty) ---
	array_to_property_add_all :: proc(array: ArrayToProperty, in_value: ArrayToProperty) ---
	array_to_property_clear_and_add_all :: proc(array: ArrayToProperty, in_value: ArrayToProperty) ---
	array_to_property_remove_at :: proc(array: ArrayToProperty, in_index: c.size_t) ---
	array_to_property_contains :: proc(array: ArrayToProperty, in_value: ToProperty) -> c.bool ---
	array_to_property_index_of :: proc(array: ArrayToProperty, in_value: ToProperty) -> c.int ---
	array_to_property_buffer :: proc(array: ArrayToProperty) -> [^]ToProperty ---
	array_track_entry_create :: proc() -> ArrayTrackEntry ---
	array_track_entry_create_with_capacity :: proc(initial_capacity: c.size_t) -> ArrayTrackEntry ---
	array_track_entry_dispose :: proc(array: ArrayTrackEntry) ---
	array_track_entry_clear :: proc(array: ArrayTrackEntry) ---
	array_track_entry_get_capacity :: proc(array: ArrayTrackEntry) -> c.size_t ---
	array_track_entry_size :: proc(array: ArrayTrackEntry) -> c.size_t ---
	array_track_entry_set_size :: proc(array: ArrayTrackEntry, new_size: c.size_t, default_value: TrackEntry) -> ArrayTrackEntry ---
	array_track_entry_ensure_capacity :: proc(array: ArrayTrackEntry, new_capacity: c.size_t) ---
	array_track_entry_add :: proc(array: ArrayTrackEntry, in_value: TrackEntry) ---
	array_track_entry_add_all :: proc(array: ArrayTrackEntry, in_value: ArrayTrackEntry) ---
	array_track_entry_clear_and_add_all :: proc(array: ArrayTrackEntry, in_value: ArrayTrackEntry) ---
	array_track_entry_remove_at :: proc(array: ArrayTrackEntry, in_index: c.size_t) ---
	array_track_entry_contains :: proc(array: ArrayTrackEntry, in_value: TrackEntry) -> c.bool ---
	array_track_entry_index_of :: proc(array: ArrayTrackEntry, in_value: TrackEntry) -> c.int ---
	array_track_entry_buffer :: proc(array: ArrayTrackEntry) -> [^]TrackEntry ---
	array_update_create :: proc() -> ArrayUpdate ---
	array_update_create_with_capacity :: proc(initial_capacity: c.size_t) -> ArrayUpdate ---
	array_update_dispose :: proc(array: ArrayUpdate) ---
	array_update_clear :: proc(array: ArrayUpdate) ---
	array_update_get_capacity :: proc(array: ArrayUpdate) -> c.size_t ---
	array_update_size :: proc(array: ArrayUpdate) -> c.size_t ---
	array_update_set_size :: proc(array: ArrayUpdate, new_size: c.size_t, default_value: Update) -> ArrayUpdate ---
	array_update_ensure_capacity :: proc(array: ArrayUpdate, new_capacity: c.size_t) ---
	array_update_add :: proc(array: ArrayUpdate, in_value: Update) ---
	array_update_add_all :: proc(array: ArrayUpdate, in_value: ArrayUpdate) ---
	array_update_clear_and_add_all :: proc(array: ArrayUpdate, in_value: ArrayUpdate) ---
	array_update_remove_at :: proc(array: ArrayUpdate, in_index: c.size_t) ---
	array_update_contains :: proc(array: ArrayUpdate, in_value: Update) -> c.bool ---
	array_update_index_of :: proc(array: ArrayUpdate, in_value: Update) -> c.int ---
	array_update_buffer :: proc(array: ArrayUpdate) -> [^]Update ---
	atlas_dispose :: proc(self: Atlas) ---
	atlas_flip_v :: proc(self: Atlas) ---
	atlas_find_region :: proc(self: Atlas, name: cstring) -> AtlasRegion ---
	atlas_get_pages :: proc(self: Atlas) -> ArrayAtlasPage ---
	atlas_get_regions :: proc(self: Atlas) -> ArrayAtlasRegion ---
	atlas_attachment_loader_create :: proc(atlas: Atlas) -> AtlasAttachmentLoader ---
	atlas_attachment_loader_dispose :: proc(self: AtlasAttachmentLoader) ---
	atlas_attachment_loader_new_region_attachment :: proc(self: AtlasAttachmentLoader, skin: Skin, name: cstring, path: cstring, sequence: Sequence) -> RegionAttachment ---
	atlas_attachment_loader_new_mesh_attachment :: proc(self: AtlasAttachmentLoader, skin: Skin, name: cstring, path: cstring, sequence: Sequence) -> MeshAttachment ---
	atlas_attachment_loader_new_bounding_box_attachment :: proc(self: AtlasAttachmentLoader, skin: Skin, name: cstring) -> BoundingBoxAttachment ---
	atlas_attachment_loader_new_path_attachment :: proc(self: AtlasAttachmentLoader, skin: Skin, name: cstring) -> PathAttachment ---
	atlas_attachment_loader_new_point_attachment :: proc(self: AtlasAttachmentLoader, skin: Skin, name: cstring) -> PointAttachment ---
	atlas_attachment_loader_new_clipping_attachment :: proc(self: AtlasAttachmentLoader, skin: Skin, name: cstring) -> ClippingAttachment ---
	atlas_attachment_loader_find_region :: proc(self: AtlasAttachmentLoader, name: cstring) -> AtlasRegion ---
	atlas_page_create :: proc(in_name: cstring) -> AtlasPage ---
	atlas_page_dispose :: proc(self: AtlasPage) ---
	atlas_page_get_name :: proc(self: AtlasPage) -> cstring ---
	atlas_page_set_name :: proc(self: AtlasPage, value: cstring) ---
	atlas_page_get_texture_path :: proc(self: AtlasPage) -> cstring ---
	atlas_page_set_texture_path :: proc(self: AtlasPage, value: cstring) ---
	atlas_page_get_format :: proc(self: AtlasPage) -> Format ---
	atlas_page_set_format :: proc(self: AtlasPage, value: Format) ---
	atlas_page_get_min_filter :: proc(self: AtlasPage) -> TextureFilter ---
	atlas_page_set_min_filter :: proc(self: AtlasPage, value: TextureFilter) ---
	atlas_page_get_mag_filter :: proc(self: AtlasPage) -> TextureFilter ---
	atlas_page_set_mag_filter :: proc(self: AtlasPage, value: TextureFilter) ---
	atlas_page_get_u_wrap :: proc(self: AtlasPage) -> TextureWrap ---
	atlas_page_set_u_wrap :: proc(self: AtlasPage, value: TextureWrap) ---
	atlas_page_get_v_wrap :: proc(self: AtlasPage) -> TextureWrap ---
	atlas_page_set_v_wrap :: proc(self: AtlasPage, value: TextureWrap) ---
	atlas_page_get_width :: proc(self: AtlasPage) -> c.int ---
	atlas_page_set_width :: proc(self: AtlasPage, value: c.int) ---
	atlas_page_get_height :: proc(self: AtlasPage) -> c.int ---
	atlas_page_set_height :: proc(self: AtlasPage, value: c.int) ---
	atlas_page_get_pma :: proc(self: AtlasPage) -> c.bool ---
	atlas_page_set_pma :: proc(self: AtlasPage, value: c.bool) ---
	atlas_page_get_index :: proc(self: AtlasPage) -> c.int ---
	atlas_page_set_index :: proc(self: AtlasPage, value: c.int) ---
	atlas_page_get_texture :: proc(self: AtlasPage) -> rawptr ---
	atlas_page_set_texture :: proc(self: AtlasPage, value: rawptr) ---
	atlas_region_create :: proc() -> AtlasRegion ---
	atlas_region_dispose :: proc(self: AtlasRegion) ---
	atlas_region_get_rtti :: proc(self: AtlasRegion) -> Rtti ---
	atlas_region_get_page :: proc(self: AtlasRegion) -> AtlasPage ---
	atlas_region_get_name :: proc(self: AtlasRegion) -> cstring ---
	atlas_region_get_index :: proc(self: AtlasRegion) -> c.int ---
	atlas_region_get_x :: proc(self: AtlasRegion) -> c.int ---
	atlas_region_get_y :: proc(self: AtlasRegion) -> c.int ---
	atlas_region_get_offset_x :: proc(self: AtlasRegion) -> c.float ---
	atlas_region_get_offset_y :: proc(self: AtlasRegion) -> c.float ---
	atlas_region_get_packed_width :: proc(self: AtlasRegion) -> c.int ---
	atlas_region_get_packed_height :: proc(self: AtlasRegion) -> c.int ---
	atlas_region_get_original_width :: proc(self: AtlasRegion) -> c.int ---
	atlas_region_get_original_height :: proc(self: AtlasRegion) -> c.int ---
	atlas_region_get_rotate :: proc(self: AtlasRegion) -> c.bool ---
	atlas_region_get_degrees :: proc(self: AtlasRegion) -> c.int ---
	atlas_region_get_splits :: proc(self: AtlasRegion) -> ArrayInt ---
	atlas_region_get_pads :: proc(self: AtlasRegion) -> ArrayInt ---
	atlas_region_get_values :: proc(self: AtlasRegion) -> ArrayFloat ---
	atlas_region_set_page :: proc(self: AtlasRegion, value: AtlasPage) ---
	atlas_region_set_name :: proc(self: AtlasRegion, value: cstring) ---
	atlas_region_set_index :: proc(self: AtlasRegion, value: c.int) ---
	atlas_region_set_x :: proc(self: AtlasRegion, value: c.int) ---
	atlas_region_set_y :: proc(self: AtlasRegion, value: c.int) ---
	atlas_region_set_offset_x :: proc(self: AtlasRegion, value: c.float) ---
	atlas_region_set_offset_y :: proc(self: AtlasRegion, value: c.float) ---
	atlas_region_set_packed_width :: proc(self: AtlasRegion, value: c.int) ---
	atlas_region_set_packed_height :: proc(self: AtlasRegion, value: c.int) ---
	atlas_region_set_original_width :: proc(self: AtlasRegion, value: c.int) ---
	atlas_region_set_original_height :: proc(self: AtlasRegion, value: c.int) ---
	atlas_region_set_rotate :: proc(self: AtlasRegion, value: c.bool) ---
	atlas_region_set_degrees :: proc(self: AtlasRegion, value: c.int) ---
	atlas_region_set_splits :: proc(self: AtlasRegion, value: ArrayInt) ---
	atlas_region_set_pads :: proc(self: AtlasRegion, value: ArrayInt) ---
	atlas_region_set_values :: proc(self: AtlasRegion, value: ArrayFloat) ---
	atlas_region_get_u :: proc(self: AtlasRegion) -> c.float ---
	atlas_region_set_u :: proc(self: AtlasRegion, value: c.float) ---
	atlas_region_get_v :: proc(self: AtlasRegion) -> c.float ---
	atlas_region_set_v :: proc(self: AtlasRegion, value: c.float) ---
	atlas_region_get_u2 :: proc(self: AtlasRegion) -> c.float ---
	atlas_region_set_u2 :: proc(self: AtlasRegion, value: c.float) ---
	atlas_region_get_v2 :: proc(self: AtlasRegion) -> c.float ---
	atlas_region_set_v2 :: proc(self: AtlasRegion, value: c.float) ---
	atlas_region_get_region_width :: proc(self: AtlasRegion) -> c.int ---
	atlas_region_set_region_width :: proc(self: AtlasRegion, value: c.int) ---
	atlas_region_get_region_height :: proc(self: AtlasRegion) -> c.int ---
	atlas_region_set_region_height :: proc(self: AtlasRegion, value: c.int) ---
	atlas_region_get_renderer_object :: proc(self: AtlasRegion) -> rawptr ---
	atlas_region_set_renderer_object :: proc(self: AtlasRegion, value: rawptr) ---
	atlas_region_rtti :: proc() -> Rtti ---
	attachment_dispose :: proc(self: Attachment) ---
	attachment_get_rtti :: proc(self: Attachment) -> Rtti ---
	attachment_get_name :: proc(self: Attachment) -> cstring ---
	attachment_copy :: proc(self: Attachment) -> Attachment ---
	attachment_get_timeline_attachment :: proc(self: Attachment) -> Attachment ---
	attachment_set_timeline_attachment :: proc(self: Attachment, attachment: Attachment) ---
	attachment_get_timeline_slots :: proc(self: Attachment) -> ArrayInt ---
	attachment_set_timeline_slots :: proc(self: Attachment, timeline_slots: ArrayInt) ---
	attachment_is_timeline_active :: proc(self: Attachment, slots: ArraySlot, slot_index: c.int, applied_pose: c.bool) -> c.bool ---
	attachment_get_ref_count :: proc(self: Attachment) -> c.int ---
	attachment_reference :: proc(self: Attachment) ---
	attachment_dereference :: proc(self: Attachment) ---
	attachment_rtti :: proc() -> Rtti ---
	attachment_loader_dispose :: proc(self: AttachmentLoader) ---
	attachment_loader_new_region_attachment :: proc(self: AttachmentLoader, skin: Skin, name: cstring, path: cstring, sequence: Sequence) -> RegionAttachment ---
	attachment_loader_new_mesh_attachment :: proc(self: AttachmentLoader, skin: Skin, name: cstring, path: cstring, sequence: Sequence) -> MeshAttachment ---
	attachment_loader_new_bounding_box_attachment :: proc(self: AttachmentLoader, skin: Skin, name: cstring) -> BoundingBoxAttachment ---
	attachment_loader_new_path_attachment :: proc(self: AttachmentLoader, skin: Skin, name: cstring) -> PathAttachment ---
	attachment_loader_new_point_attachment :: proc(self: AttachmentLoader, skin: Skin, name: cstring) -> PointAttachment ---
	attachment_loader_new_clipping_attachment :: proc(self: AttachmentLoader, skin: Skin, name: cstring) -> ClippingAttachment ---
	attachment_timeline_create :: proc(frame_count: c.size_t, slot_index: c.int) -> AttachmentTimeline ---
	attachment_timeline_dispose :: proc(self: AttachmentTimeline) ---
	attachment_timeline_get_rtti :: proc(self: AttachmentTimeline) -> Rtti ---
	attachment_timeline_apply :: proc(self: AttachmentTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	attachment_timeline_set_frame :: proc(self: AttachmentTimeline, frame: c.int, time: c.float, attachment_name: cstring) ---
	attachment_timeline_get_slot_index :: proc(self: AttachmentTimeline) -> c.int ---
	attachment_timeline_set_slot_index :: proc(self: AttachmentTimeline, in_value: c.int) ---
	attachment_timeline_get_additive :: proc(self: AttachmentTimeline) -> c.bool ---
	attachment_timeline_get_instant :: proc(self: AttachmentTimeline) -> c.bool ---
	attachment_timeline_get_frame_entries :: proc(self: AttachmentTimeline) -> c.size_t ---
	attachment_timeline_get_frame_count :: proc(self: AttachmentTimeline) -> c.size_t ---
	attachment_timeline_get_frames :: proc(self: AttachmentTimeline) -> ArrayFloat ---
	attachment_timeline_get_duration :: proc(self: AttachmentTimeline) -> c.float ---
	attachment_timeline_get_property_ids :: proc(self: AttachmentTimeline) -> ArrayPropertyId ---
	attachment_timeline_rtti :: proc() -> Rtti ---
	bone_create :: proc(data: BoneData, parent: Bone) -> Bone ---
	bone_create2 :: proc(bone: Bone, parent: Bone) -> Bone ---
	bone_dispose :: proc(self: Bone) ---
	bone_get_rtti :: proc(self: Bone) -> Rtti ---
	bone_get_parent :: proc(self: Bone) -> Bone ---
	bone_get_children :: proc(self: Bone) -> ArrayBone ---
	bone_is_y_down :: proc() -> c.bool ---
	bone_set_y_down :: proc(value: c.bool) ---
	bone_update :: proc(self: Bone, skeleton: Skeleton, physics: Physics) ---
	bone_get_data :: proc(self: Bone) -> BoneData ---
	bone_get_pose :: proc(self: Bone) -> BonePose ---
	bone_get_applied_pose :: proc(self: Bone) -> BonePose ---
	bone_reset_constrained :: proc(self: Bone) ---
	bone_constrained :: proc(self: Bone) ---
	bone_is_pose_equal_to_applied :: proc(self: Bone) -> c.bool ---
	bone_is_active :: proc(self: Bone) -> c.bool ---
	bone_set_active :: proc(self: Bone, active: c.bool) ---
	bone_rtti :: proc() -> Rtti ---
	bone_data_create :: proc(index: c.int, name: cstring, parent: BoneData) -> BoneData ---
	bone_data_dispose :: proc(self: BoneData) ---
	bone_data_get_index :: proc(self: BoneData) -> c.int ---
	bone_data_get_parent :: proc(self: BoneData) -> BoneData ---
	bone_data_get_length :: proc(self: BoneData) -> c.float ---
	bone_data_set_length :: proc(self: BoneData, in_value: c.float) ---
	bone_data_get_color :: proc(self: BoneData) -> Color ---
	bone_data_get_icon :: proc(self: BoneData) -> cstring ---
	bone_data_set_icon :: proc(self: BoneData, icon: cstring) ---
	bone_data_get_visible :: proc(self: BoneData) -> c.bool ---
	bone_data_set_visible :: proc(self: BoneData, in_value: c.bool) ---
	bone_data_get_setup_pose :: proc(self: BoneData) -> BonePose ---
	bone_data_get_name :: proc(self: BoneData) -> cstring ---
	bone_data_get_skin_required :: proc(self: BoneData) -> c.bool ---
	bone_data_set_skin_required :: proc(self: BoneData, skin_required: c.bool) ---
	bone_local_create :: proc() -> BoneLocal ---
	bone_local_dispose :: proc(self: BoneLocal) ---
	bone_local_set :: proc(self: BoneLocal, pose: BoneLocal) ---
	bone_local_get_x :: proc(self: BoneLocal) -> c.float ---
	bone_local_set_x :: proc(self: BoneLocal, x: c.float) ---
	bone_local_get_y :: proc(self: BoneLocal) -> c.float ---
	bone_local_set_y :: proc(self: BoneLocal, y: c.float) ---
	bone_local_set_position :: proc(self: BoneLocal, x: c.float, y: c.float) ---
	bone_local_get_rotation :: proc(self: BoneLocal) -> c.float ---
	bone_local_set_rotation :: proc(self: BoneLocal, rotation: c.float) ---
	bone_local_get_scale_x :: proc(self: BoneLocal) -> c.float ---
	bone_local_set_scale_x :: proc(self: BoneLocal, scale_x: c.float) ---
	bone_local_get_scale_y :: proc(self: BoneLocal) -> c.float ---
	bone_local_set_scale_y :: proc(self: BoneLocal, scale_y: c.float) ---
	bone_local_set_scale_1 :: proc(self: BoneLocal, scale_x: c.float, scale_y: c.float) ---
	bone_local_set_scale_2 :: proc(self: BoneLocal, scale: c.float) ---
	bone_local_get_shear_x :: proc(self: BoneLocal) -> c.float ---
	bone_local_set_shear_x :: proc(self: BoneLocal, shear_x: c.float) ---
	bone_local_get_shear_y :: proc(self: BoneLocal) -> c.float ---
	bone_local_set_shear_y :: proc(self: BoneLocal, shear_y: c.float) ---
	bone_local_get_inherit :: proc(self: BoneLocal) -> Inherit ---
	bone_local_set_inherit :: proc(self: BoneLocal, inherit: Inherit) ---
	bone_pose_create :: proc() -> BonePose ---
	bone_pose_dispose :: proc(self: BonePose) ---
	bone_pose_get_rtti :: proc(self: BonePose) -> Rtti ---
	bone_pose_update :: proc(self: BonePose, skeleton: Skeleton, physics: Physics) ---
	bone_pose_update_world_transform :: proc(self: BonePose, skeleton: Skeleton) ---
	bone_pose_update_local_transform :: proc(self: BonePose, skeleton: Skeleton) ---
	bone_pose_validate_local_transform :: proc(self: BonePose, skeleton: Skeleton) ---
	bone_pose_modify_local :: proc(self: BonePose, skeleton: Skeleton) ---
	bone_pose_modify_world :: proc(self: BonePose, update: c.int) ---
	bone_pose_reset_world :: proc(self: BonePose, update: c.int) ---
	bone_pose_get_a :: proc(self: BonePose) -> c.float ---
	bone_pose_set_a :: proc(self: BonePose, a: c.float) ---
	bone_pose_get_b :: proc(self: BonePose) -> c.float ---
	bone_pose_set_b :: proc(self: BonePose, b: c.float) ---
	bone_pose_get_c :: proc(self: BonePose) -> c.float ---
	bone_pose_set_c :: proc(self: BonePose, c: c.float) ---
	bone_pose_get_d :: proc(self: BonePose) -> c.float ---
	bone_pose_set_d :: proc(self: BonePose, d: c.float) ---
	bone_pose_get_world_x :: proc(self: BonePose) -> c.float ---
	bone_pose_set_world_x :: proc(self: BonePose, world_x: c.float) ---
	bone_pose_get_world_y :: proc(self: BonePose) -> c.float ---
	bone_pose_set_world_y :: proc(self: BonePose, world_y: c.float) ---
	bone_pose_get_world_rotation_x :: proc(self: BonePose) -> c.float ---
	bone_pose_get_world_rotation_y :: proc(self: BonePose) -> c.float ---
	bone_pose_get_world_scale_x :: proc(self: BonePose) -> c.float ---
	bone_pose_get_world_scale_y :: proc(self: BonePose) -> c.float ---
	bone_pose_world_to_local :: proc(self: BonePose, world_x: c.float, world_y: c.float, out_local_x: [^]c.float, out_local_y: [^]c.float) ---
	bone_pose_local_to_world :: proc(self: BonePose, local_x: c.float, local_y: c.float, out_world_x: [^]c.float, out_world_y: [^]c.float) ---
	bone_pose_world_to_parent :: proc(self: BonePose, world_x: c.float, world_y: c.float, out_parent_x: [^]c.float, out_parent_y: [^]c.float) ---
	bone_pose_parent_to_world :: proc(self: BonePose, parent_x: c.float, parent_y: c.float, out_world_x: [^]c.float, out_world_y: [^]c.float) ---
	bone_pose_world_to_local_rotation :: proc(self: BonePose, world_rotation: c.float) -> c.float ---
	bone_pose_local_to_world_rotation :: proc(self: BonePose, local_rotation: c.float) -> c.float ---
	bone_pose_rotate_world :: proc(self: BonePose, degrees: c.float) ---
	bone_pose_set :: proc(self: BonePose, pose: BoneLocal) ---
	bone_pose_get_x :: proc(self: BonePose) -> c.float ---
	bone_pose_set_x :: proc(self: BonePose, x: c.float) ---
	bone_pose_get_y :: proc(self: BonePose) -> c.float ---
	bone_pose_set_y :: proc(self: BonePose, y: c.float) ---
	bone_pose_set_position :: proc(self: BonePose, x: c.float, y: c.float) ---
	bone_pose_get_rotation :: proc(self: BonePose) -> c.float ---
	bone_pose_set_rotation :: proc(self: BonePose, rotation: c.float) ---
	bone_pose_get_scale_x :: proc(self: BonePose) -> c.float ---
	bone_pose_set_scale_x :: proc(self: BonePose, scale_x: c.float) ---
	bone_pose_get_scale_y :: proc(self: BonePose) -> c.float ---
	bone_pose_set_scale_y :: proc(self: BonePose, scale_y: c.float) ---
	bone_pose_set_scale_1 :: proc(self: BonePose, scale_x: c.float, scale_y: c.float) ---
	bone_pose_set_scale_2 :: proc(self: BonePose, scale: c.float) ---
	bone_pose_get_shear_x :: proc(self: BonePose) -> c.float ---
	bone_pose_set_shear_x :: proc(self: BonePose, shear_x: c.float) ---
	bone_pose_get_shear_y :: proc(self: BonePose) -> c.float ---
	bone_pose_set_shear_y :: proc(self: BonePose, shear_y: c.float) ---
	bone_pose_get_inherit :: proc(self: BonePose) -> Inherit ---
	bone_pose_set_inherit :: proc(self: BonePose, inherit: Inherit) ---
	bone_pose_rtti :: proc() -> Rtti ---
	bone_timeline_dispose :: proc(self: BoneTimeline) ---
	bone_timeline_get_rtti :: proc(self: BoneTimeline) -> Rtti ---
	bone_timeline_get_bone_index :: proc(self: BoneTimeline) -> c.int ---
	bone_timeline_set_bone_index :: proc(self: BoneTimeline, in_value: c.int) ---
	bone_timeline_rtti :: proc() -> Rtti ---
	bone_timeline1_dispose :: proc(self: BoneTimeline1) ---
	bone_timeline1_get_rtti :: proc(self: BoneTimeline1) -> Rtti ---
	bone_timeline1_apply :: proc(self: BoneTimeline1, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	bone_timeline1_get_bone_index :: proc(self: BoneTimeline1) -> c.int ---
	bone_timeline1_set_bone_index :: proc(self: BoneTimeline1, in_value: c.int) ---
	bone_timeline1_set_frame :: proc(self: BoneTimeline1, frame: c.size_t, time: c.float, value: c.float) ---
	bone_timeline1_get_curve_value :: proc(self: BoneTimeline1, time: c.float) -> c.float ---
	bone_timeline1_get_relative_value :: proc(self: BoneTimeline1, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	bone_timeline1_get_absolute_value_1 :: proc(self: BoneTimeline1, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	bone_timeline1_get_absolute_value_2 :: proc(self: BoneTimeline1, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float, value: c.float) -> c.float ---
	bone_timeline1_get_scale_value :: proc(self: BoneTimeline1, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, current: c.float, setup: c.float) -> c.float ---
	bone_timeline1_set_linear :: proc(self: BoneTimeline1, frame: c.size_t) ---
	bone_timeline1_set_stepped :: proc(self: BoneTimeline1, frame: c.size_t) ---
	bone_timeline1_set_bezier :: proc(self: BoneTimeline1, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	bone_timeline1_get_bezier_value :: proc(self: BoneTimeline1, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	bone_timeline1_get_curves :: proc(self: BoneTimeline1) -> ArrayFloat ---
	bone_timeline1_get_additive :: proc(self: BoneTimeline1) -> c.bool ---
	bone_timeline1_get_instant :: proc(self: BoneTimeline1) -> c.bool ---
	bone_timeline1_get_frame_entries :: proc(self: BoneTimeline1) -> c.size_t ---
	bone_timeline1_get_frame_count :: proc(self: BoneTimeline1) -> c.size_t ---
	bone_timeline1_get_frames :: proc(self: BoneTimeline1) -> ArrayFloat ---
	bone_timeline1_get_duration :: proc(self: BoneTimeline1) -> c.float ---
	bone_timeline1_get_property_ids :: proc(self: BoneTimeline1) -> ArrayPropertyId ---
	bone_timeline1_rtti :: proc() -> Rtti ---
	bone_timeline2_dispose :: proc(self: BoneTimeline2) ---
	bone_timeline2_get_rtti :: proc(self: BoneTimeline2) -> Rtti ---
	bone_timeline2_apply :: proc(self: BoneTimeline2, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	bone_timeline2_get_bone_index :: proc(self: BoneTimeline2) -> c.int ---
	bone_timeline2_set_bone_index :: proc(self: BoneTimeline2, in_value: c.int) ---
	bone_timeline2_set_frame :: proc(self: BoneTimeline2, frame: c.size_t, time: c.float, value1: c.float, value2: c.float) ---
	bone_timeline2_set_linear :: proc(self: BoneTimeline2, frame: c.size_t) ---
	bone_timeline2_set_stepped :: proc(self: BoneTimeline2, frame: c.size_t) ---
	bone_timeline2_set_bezier :: proc(self: BoneTimeline2, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	bone_timeline2_get_bezier_value :: proc(self: BoneTimeline2, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	bone_timeline2_get_curves :: proc(self: BoneTimeline2) -> ArrayFloat ---
	bone_timeline2_get_additive :: proc(self: BoneTimeline2) -> c.bool ---
	bone_timeline2_get_instant :: proc(self: BoneTimeline2) -> c.bool ---
	bone_timeline2_get_frame_entries :: proc(self: BoneTimeline2) -> c.size_t ---
	bone_timeline2_get_frame_count :: proc(self: BoneTimeline2) -> c.size_t ---
	bone_timeline2_get_frames :: proc(self: BoneTimeline2) -> ArrayFloat ---
	bone_timeline2_get_duration :: proc(self: BoneTimeline2) -> c.float ---
	bone_timeline2_get_property_ids :: proc(self: BoneTimeline2) -> ArrayPropertyId ---
	bone_timeline2_rtti :: proc() -> Rtti ---
	bounding_box_attachment_create :: proc(name: cstring) -> BoundingBoxAttachment ---
	bounding_box_attachment_dispose :: proc(self: BoundingBoxAttachment) ---
	bounding_box_attachment_get_rtti :: proc(self: BoundingBoxAttachment) -> Rtti ---
	bounding_box_attachment_get_color :: proc(self: BoundingBoxAttachment) -> Color ---
	bounding_box_attachment_copy :: proc(self: BoundingBoxAttachment) -> Attachment ---
	bounding_box_attachment_compute_world_vertices_1 :: proc(self: BoundingBoxAttachment, skeleton: Skeleton, slot: Slot, start: c.size_t, count: c.size_t, world_vertices: [^]c.float, offset: c.size_t, stride: c.size_t) ---
	bounding_box_attachment_compute_world_vertices_2 :: proc(self: BoundingBoxAttachment, skeleton: Skeleton, slot: Slot, start: c.size_t, count: c.size_t, world_vertices: ArrayFloat, offset: c.size_t, stride: c.size_t) ---
	bounding_box_attachment_get_id :: proc(self: BoundingBoxAttachment) -> c.int ---
	bounding_box_attachment_get_bones :: proc(self: BoundingBoxAttachment) -> ArrayInt ---
	bounding_box_attachment_set_bones :: proc(self: BoundingBoxAttachment, bones: ArrayInt) ---
	bounding_box_attachment_get_vertices :: proc(self: BoundingBoxAttachment) -> ArrayFloat ---
	bounding_box_attachment_set_vertices :: proc(self: BoundingBoxAttachment, vertices: ArrayFloat) ---
	bounding_box_attachment_get_world_vertices_length :: proc(self: BoundingBoxAttachment) -> c.size_t ---
	bounding_box_attachment_set_world_vertices_length :: proc(self: BoundingBoxAttachment, in_value: c.size_t) ---
	bounding_box_attachment_get_timeline_attachment :: proc(self: BoundingBoxAttachment) -> Attachment ---
	bounding_box_attachment_set_timeline_attachment :: proc(self: BoundingBoxAttachment, attachment: Attachment) ---
	bounding_box_attachment_copy_to :: proc(self: BoundingBoxAttachment, other: VertexAttachment) ---
	bounding_box_attachment_get_name :: proc(self: BoundingBoxAttachment) -> cstring ---
	bounding_box_attachment_get_timeline_slots :: proc(self: BoundingBoxAttachment) -> ArrayInt ---
	bounding_box_attachment_set_timeline_slots :: proc(self: BoundingBoxAttachment, timeline_slots: ArrayInt) ---
	bounding_box_attachment_is_timeline_active :: proc(self: BoundingBoxAttachment, slots: ArraySlot, slot_index: c.int, applied_pose: c.bool) -> c.bool ---
	bounding_box_attachment_get_ref_count :: proc(self: BoundingBoxAttachment) -> c.int ---
	bounding_box_attachment_reference :: proc(self: BoundingBoxAttachment) ---
	bounding_box_attachment_dereference :: proc(self: BoundingBoxAttachment) ---
	bounding_box_attachment_rtti :: proc() -> Rtti ---
	alpha_timeline_cast_to_curve_timeline1 :: proc(obj: AlphaTimeline) -> CurveTimeline1 ---
	alpha_timeline_cast_to_curve_timeline :: proc(obj: AlphaTimeline) -> CurveTimeline ---
	alpha_timeline_cast_to_timeline :: proc(obj: AlphaTimeline) -> Timeline ---
	alpha_timeline_cast_to_slot_timeline :: proc(obj: AlphaTimeline) -> SlotTimeline ---
	atlas_attachment_loader_cast_to_attachment_loader :: proc(obj: AtlasAttachmentLoader) -> AttachmentLoader ---
	atlas_region_cast_to_texture_region :: proc(obj: AtlasRegion) -> TextureRegion ---
	attachment_timeline_cast_to_timeline :: proc(obj: AttachmentTimeline) -> Timeline ---
	attachment_timeline_cast_to_slot_timeline :: proc(obj: AttachmentTimeline) -> SlotTimeline ---
	bone_cast_to_posed :: proc(obj: Bone) -> Posed ---
	bone_cast_to_posed_active :: proc(obj: Bone) -> PosedActive ---
	bone_cast_to_update :: proc(obj: Bone) -> Update ---
	bone_data_cast_to_posed_data :: proc(obj: BoneData) -> PosedData ---
	bone_pose_cast_to_bone_local :: proc(obj: BonePose) -> BoneLocal ---
	bone_pose_cast_to_update :: proc(obj: BonePose) -> Update ---
	bone_timeline1_cast_to_curve_timeline1 :: proc(obj: BoneTimeline1) -> CurveTimeline1 ---
	bone_timeline1_cast_to_curve_timeline :: proc(obj: BoneTimeline1) -> CurveTimeline ---
	bone_timeline1_cast_to_timeline :: proc(obj: BoneTimeline1) -> Timeline ---
	bone_timeline1_cast_to_bone_timeline :: proc(obj: BoneTimeline1) -> BoneTimeline ---
	bone_timeline2_cast_to_curve_timeline :: proc(obj: BoneTimeline2) -> CurveTimeline ---
	bone_timeline2_cast_to_timeline :: proc(obj: BoneTimeline2) -> Timeline ---
	bone_timeline2_cast_to_bone_timeline :: proc(obj: BoneTimeline2) -> BoneTimeline ---
	bounding_box_attachment_cast_to_vertex_attachment :: proc(obj: BoundingBoxAttachment) -> VertexAttachment ---
	bounding_box_attachment_cast_to_attachment :: proc(obj: BoundingBoxAttachment) -> Attachment ---
	clipping_attachment_cast_to_vertex_attachment :: proc(obj: ClippingAttachment) -> VertexAttachment ---
	clipping_attachment_cast_to_attachment :: proc(obj: ClippingAttachment) -> Attachment ---
	constraint_cast_to_update :: proc(obj: Constraint) -> Update ---
	constraint_timeline1_cast_to_curve_timeline1 :: proc(obj: ConstraintTimeline1) -> CurveTimeline1 ---
	constraint_timeline1_cast_to_curve_timeline :: proc(obj: ConstraintTimeline1) -> CurveTimeline ---
	constraint_timeline1_cast_to_timeline :: proc(obj: ConstraintTimeline1) -> Timeline ---
	constraint_timeline1_cast_to_constraint_timeline :: proc(obj: ConstraintTimeline1) -> ConstraintTimeline ---
	curve_timeline_cast_to_timeline :: proc(obj: CurveTimeline) -> Timeline ---
	curve_timeline1_cast_to_curve_timeline :: proc(obj: CurveTimeline1) -> CurveTimeline ---
	curve_timeline1_cast_to_timeline :: proc(obj: CurveTimeline1) -> Timeline ---
	deform_timeline_cast_to_slot_curve_timeline :: proc(obj: DeformTimeline) -> SlotCurveTimeline ---
	deform_timeline_cast_to_curve_timeline :: proc(obj: DeformTimeline) -> CurveTimeline ---
	deform_timeline_cast_to_timeline :: proc(obj: DeformTimeline) -> Timeline ---
	deform_timeline_cast_to_slot_timeline :: proc(obj: DeformTimeline) -> SlotTimeline ---
	draw_order_folder_timeline_cast_to_timeline :: proc(obj: DrawOrderFolderTimeline) -> Timeline ---
	draw_order_timeline_cast_to_timeline :: proc(obj: DrawOrderTimeline) -> Timeline ---
	event_timeline_cast_to_timeline :: proc(obj: EventTimeline) -> Timeline ---
	from_rotate_cast_to_from_property :: proc(obj: FromRotate) -> FromProperty ---
	from_scale_x_cast_to_from_property :: proc(obj: FromScaleX) -> FromProperty ---
	from_scale_y_cast_to_from_property :: proc(obj: FromScaleY) -> FromProperty ---
	from_shear_y_cast_to_from_property :: proc(obj: FromShearY) -> FromProperty ---
	from_x_cast_to_from_property :: proc(obj: FromX) -> FromProperty ---
	from_y_cast_to_from_property :: proc(obj: FromY) -> FromProperty ---
	ik_constraint_cast_to_ik_constraint_base :: proc(obj: IkConstraint) -> IkConstraintBase ---
	ik_constraint_cast_to_posed :: proc(obj: IkConstraint) -> Posed ---
	ik_constraint_cast_to_posed_active :: proc(obj: IkConstraint) -> PosedActive ---
	ik_constraint_cast_to_constraint :: proc(obj: IkConstraint) -> Constraint ---
	ik_constraint_cast_to_update :: proc(obj: IkConstraint) -> Update ---
	ik_constraint_base_cast_to_posed :: proc(obj: IkConstraintBase) -> Posed ---
	ik_constraint_base_cast_to_posed_active :: proc(obj: IkConstraintBase) -> PosedActive ---
	ik_constraint_base_cast_to_constraint :: proc(obj: IkConstraintBase) -> Constraint ---
	ik_constraint_base_cast_to_update :: proc(obj: IkConstraintBase) -> Update ---
	ik_constraint_data_cast_to_posed_data :: proc(obj: IkConstraintData) -> PosedData ---
	ik_constraint_data_cast_to_constraint_data :: proc(obj: IkConstraintData) -> ConstraintData ---
	ik_constraint_timeline_cast_to_curve_timeline :: proc(obj: IkConstraintTimeline) -> CurveTimeline ---
	ik_constraint_timeline_cast_to_timeline :: proc(obj: IkConstraintTimeline) -> Timeline ---
	ik_constraint_timeline_cast_to_constraint_timeline :: proc(obj: IkConstraintTimeline) -> ConstraintTimeline ---
	inherit_timeline_cast_to_timeline :: proc(obj: InheritTimeline) -> Timeline ---
	inherit_timeline_cast_to_bone_timeline :: proc(obj: InheritTimeline) -> BoneTimeline ---
	mesh_attachment_cast_to_vertex_attachment :: proc(obj: MeshAttachment) -> VertexAttachment ---
	mesh_attachment_cast_to_attachment :: proc(obj: MeshAttachment) -> Attachment ---
	path_attachment_cast_to_vertex_attachment :: proc(obj: PathAttachment) -> VertexAttachment ---
	path_attachment_cast_to_attachment :: proc(obj: PathAttachment) -> Attachment ---
	path_constraint_cast_to_path_constraint_base :: proc(obj: PathConstraint) -> PathConstraintBase ---
	path_constraint_cast_to_posed :: proc(obj: PathConstraint) -> Posed ---
	path_constraint_cast_to_posed_active :: proc(obj: PathConstraint) -> PosedActive ---
	path_constraint_cast_to_constraint :: proc(obj: PathConstraint) -> Constraint ---
	path_constraint_cast_to_update :: proc(obj: PathConstraint) -> Update ---
	path_constraint_base_cast_to_posed :: proc(obj: PathConstraintBase) -> Posed ---
	path_constraint_base_cast_to_posed_active :: proc(obj: PathConstraintBase) -> PosedActive ---
	path_constraint_base_cast_to_constraint :: proc(obj: PathConstraintBase) -> Constraint ---
	path_constraint_base_cast_to_update :: proc(obj: PathConstraintBase) -> Update ---
	path_constraint_data_cast_to_posed_data :: proc(obj: PathConstraintData) -> PosedData ---
	path_constraint_data_cast_to_constraint_data :: proc(obj: PathConstraintData) -> ConstraintData ---
	path_constraint_mix_timeline_cast_to_curve_timeline :: proc(obj: PathConstraintMixTimeline) -> CurveTimeline ---
	path_constraint_mix_timeline_cast_to_timeline :: proc(obj: PathConstraintMixTimeline) -> Timeline ---
	path_constraint_mix_timeline_cast_to_constraint_timeline :: proc(obj: PathConstraintMixTimeline) -> ConstraintTimeline ---
	path_constraint_position_timeline_cast_to_constraint_timeline1 :: proc(obj: PathConstraintPositionTimeline) -> ConstraintTimeline1 ---
	path_constraint_position_timeline_cast_to_curve_timeline1 :: proc(obj: PathConstraintPositionTimeline) -> CurveTimeline1 ---
	path_constraint_position_timeline_cast_to_curve_timeline :: proc(obj: PathConstraintPositionTimeline) -> CurveTimeline ---
	path_constraint_position_timeline_cast_to_timeline :: proc(obj: PathConstraintPositionTimeline) -> Timeline ---
	path_constraint_position_timeline_cast_to_constraint_timeline :: proc(obj: PathConstraintPositionTimeline) -> ConstraintTimeline ---
	path_constraint_spacing_timeline_cast_to_constraint_timeline1 :: proc(obj: PathConstraintSpacingTimeline) -> ConstraintTimeline1 ---
	path_constraint_spacing_timeline_cast_to_curve_timeline1 :: proc(obj: PathConstraintSpacingTimeline) -> CurveTimeline1 ---
	path_constraint_spacing_timeline_cast_to_curve_timeline :: proc(obj: PathConstraintSpacingTimeline) -> CurveTimeline ---
	path_constraint_spacing_timeline_cast_to_timeline :: proc(obj: PathConstraintSpacingTimeline) -> Timeline ---
	path_constraint_spacing_timeline_cast_to_constraint_timeline :: proc(obj: PathConstraintSpacingTimeline) -> ConstraintTimeline ---
	physics_constraint_cast_to_physics_constraint_base :: proc(obj: PhysicsConstraint) -> PhysicsConstraintBase ---
	physics_constraint_cast_to_posed :: proc(obj: PhysicsConstraint) -> Posed ---
	physics_constraint_cast_to_posed_active :: proc(obj: PhysicsConstraint) -> PosedActive ---
	physics_constraint_cast_to_constraint :: proc(obj: PhysicsConstraint) -> Constraint ---
	physics_constraint_cast_to_update :: proc(obj: PhysicsConstraint) -> Update ---
	physics_constraint_base_cast_to_posed :: proc(obj: PhysicsConstraintBase) -> Posed ---
	physics_constraint_base_cast_to_posed_active :: proc(obj: PhysicsConstraintBase) -> PosedActive ---
	physics_constraint_base_cast_to_constraint :: proc(obj: PhysicsConstraintBase) -> Constraint ---
	physics_constraint_base_cast_to_update :: proc(obj: PhysicsConstraintBase) -> Update ---
	physics_constraint_damping_timeline_cast_to_physics_constraint_timeline :: proc(obj: PhysicsConstraintDampingTimeline) -> PhysicsConstraintTimeline ---
	physics_constraint_damping_timeline_cast_to_curve_timeline1 :: proc(obj: PhysicsConstraintDampingTimeline) -> CurveTimeline1 ---
	physics_constraint_damping_timeline_cast_to_curve_timeline :: proc(obj: PhysicsConstraintDampingTimeline) -> CurveTimeline ---
	physics_constraint_damping_timeline_cast_to_timeline :: proc(obj: PhysicsConstraintDampingTimeline) -> Timeline ---
	physics_constraint_damping_timeline_cast_to_constraint_timeline :: proc(obj: PhysicsConstraintDampingTimeline) -> ConstraintTimeline ---
	physics_constraint_data_cast_to_posed_data :: proc(obj: PhysicsConstraintData) -> PosedData ---
	physics_constraint_data_cast_to_constraint_data :: proc(obj: PhysicsConstraintData) -> ConstraintData ---
	physics_constraint_gravity_timeline_cast_to_physics_constraint_timeline :: proc(obj: PhysicsConstraintGravityTimeline) -> PhysicsConstraintTimeline ---
	physics_constraint_gravity_timeline_cast_to_curve_timeline1 :: proc(obj: PhysicsConstraintGravityTimeline) -> CurveTimeline1 ---
	physics_constraint_gravity_timeline_cast_to_curve_timeline :: proc(obj: PhysicsConstraintGravityTimeline) -> CurveTimeline ---
	physics_constraint_gravity_timeline_cast_to_timeline :: proc(obj: PhysicsConstraintGravityTimeline) -> Timeline ---
	physics_constraint_gravity_timeline_cast_to_constraint_timeline :: proc(obj: PhysicsConstraintGravityTimeline) -> ConstraintTimeline ---
	physics_constraint_inertia_timeline_cast_to_physics_constraint_timeline :: proc(obj: PhysicsConstraintInertiaTimeline) -> PhysicsConstraintTimeline ---
	physics_constraint_inertia_timeline_cast_to_curve_timeline1 :: proc(obj: PhysicsConstraintInertiaTimeline) -> CurveTimeline1 ---
	physics_constraint_inertia_timeline_cast_to_curve_timeline :: proc(obj: PhysicsConstraintInertiaTimeline) -> CurveTimeline ---
	physics_constraint_inertia_timeline_cast_to_timeline :: proc(obj: PhysicsConstraintInertiaTimeline) -> Timeline ---
	physics_constraint_inertia_timeline_cast_to_constraint_timeline :: proc(obj: PhysicsConstraintInertiaTimeline) -> ConstraintTimeline ---
	physics_constraint_mass_timeline_cast_to_physics_constraint_timeline :: proc(obj: PhysicsConstraintMassTimeline) -> PhysicsConstraintTimeline ---
	physics_constraint_mass_timeline_cast_to_curve_timeline1 :: proc(obj: PhysicsConstraintMassTimeline) -> CurveTimeline1 ---
	physics_constraint_mass_timeline_cast_to_curve_timeline :: proc(obj: PhysicsConstraintMassTimeline) -> CurveTimeline ---
	physics_constraint_mass_timeline_cast_to_timeline :: proc(obj: PhysicsConstraintMassTimeline) -> Timeline ---
	physics_constraint_mass_timeline_cast_to_constraint_timeline :: proc(obj: PhysicsConstraintMassTimeline) -> ConstraintTimeline ---
	physics_constraint_mix_timeline_cast_to_physics_constraint_timeline :: proc(obj: PhysicsConstraintMixTimeline) -> PhysicsConstraintTimeline ---
	physics_constraint_mix_timeline_cast_to_curve_timeline1 :: proc(obj: PhysicsConstraintMixTimeline) -> CurveTimeline1 ---
	physics_constraint_mix_timeline_cast_to_curve_timeline :: proc(obj: PhysicsConstraintMixTimeline) -> CurveTimeline ---
	physics_constraint_mix_timeline_cast_to_timeline :: proc(obj: PhysicsConstraintMixTimeline) -> Timeline ---
	physics_constraint_mix_timeline_cast_to_constraint_timeline :: proc(obj: PhysicsConstraintMixTimeline) -> ConstraintTimeline ---
	physics_constraint_reset_timeline_cast_to_timeline :: proc(obj: PhysicsConstraintResetTimeline) -> Timeline ---
	physics_constraint_reset_timeline_cast_to_constraint_timeline :: proc(obj: PhysicsConstraintResetTimeline) -> ConstraintTimeline ---
	physics_constraint_strength_timeline_cast_to_physics_constraint_timeline :: proc(obj: PhysicsConstraintStrengthTimeline) -> PhysicsConstraintTimeline ---
	physics_constraint_strength_timeline_cast_to_curve_timeline1 :: proc(obj: PhysicsConstraintStrengthTimeline) -> CurveTimeline1 ---
	physics_constraint_strength_timeline_cast_to_curve_timeline :: proc(obj: PhysicsConstraintStrengthTimeline) -> CurveTimeline ---
	physics_constraint_strength_timeline_cast_to_timeline :: proc(obj: PhysicsConstraintStrengthTimeline) -> Timeline ---
	physics_constraint_strength_timeline_cast_to_constraint_timeline :: proc(obj: PhysicsConstraintStrengthTimeline) -> ConstraintTimeline ---
	physics_constraint_timeline_cast_to_curve_timeline1 :: proc(obj: PhysicsConstraintTimeline) -> CurveTimeline1 ---
	physics_constraint_timeline_cast_to_curve_timeline :: proc(obj: PhysicsConstraintTimeline) -> CurveTimeline ---
	physics_constraint_timeline_cast_to_timeline :: proc(obj: PhysicsConstraintTimeline) -> Timeline ---
	physics_constraint_timeline_cast_to_constraint_timeline :: proc(obj: PhysicsConstraintTimeline) -> ConstraintTimeline ---
	physics_constraint_wind_timeline_cast_to_physics_constraint_timeline :: proc(obj: PhysicsConstraintWindTimeline) -> PhysicsConstraintTimeline ---
	physics_constraint_wind_timeline_cast_to_curve_timeline1 :: proc(obj: PhysicsConstraintWindTimeline) -> CurveTimeline1 ---
	physics_constraint_wind_timeline_cast_to_curve_timeline :: proc(obj: PhysicsConstraintWindTimeline) -> CurveTimeline ---
	physics_constraint_wind_timeline_cast_to_timeline :: proc(obj: PhysicsConstraintWindTimeline) -> Timeline ---
	physics_constraint_wind_timeline_cast_to_constraint_timeline :: proc(obj: PhysicsConstraintWindTimeline) -> ConstraintTimeline ---
	point_attachment_cast_to_attachment :: proc(obj: PointAttachment) -> Attachment ---
	region_attachment_cast_to_attachment :: proc(obj: RegionAttachment) -> Attachment ---
	rgb2_timeline_cast_to_slot_curve_timeline :: proc(obj: Rgb2Timeline) -> SlotCurveTimeline ---
	rgb2_timeline_cast_to_curve_timeline :: proc(obj: Rgb2Timeline) -> CurveTimeline ---
	rgb2_timeline_cast_to_timeline :: proc(obj: Rgb2Timeline) -> Timeline ---
	rgb2_timeline_cast_to_slot_timeline :: proc(obj: Rgb2Timeline) -> SlotTimeline ---
	rgba2_timeline_cast_to_slot_curve_timeline :: proc(obj: Rgba2Timeline) -> SlotCurveTimeline ---
	rgba2_timeline_cast_to_curve_timeline :: proc(obj: Rgba2Timeline) -> CurveTimeline ---
	rgba2_timeline_cast_to_timeline :: proc(obj: Rgba2Timeline) -> Timeline ---
	rgba2_timeline_cast_to_slot_timeline :: proc(obj: Rgba2Timeline) -> SlotTimeline ---
	rgba_timeline_cast_to_slot_curve_timeline :: proc(obj: RgbaTimeline) -> SlotCurveTimeline ---
	rgba_timeline_cast_to_curve_timeline :: proc(obj: RgbaTimeline) -> CurveTimeline ---
	rgba_timeline_cast_to_timeline :: proc(obj: RgbaTimeline) -> Timeline ---
	rgba_timeline_cast_to_slot_timeline :: proc(obj: RgbaTimeline) -> SlotTimeline ---
	rgb_timeline_cast_to_slot_curve_timeline :: proc(obj: RgbTimeline) -> SlotCurveTimeline ---
	rgb_timeline_cast_to_curve_timeline :: proc(obj: RgbTimeline) -> CurveTimeline ---
	rgb_timeline_cast_to_timeline :: proc(obj: RgbTimeline) -> Timeline ---
	rgb_timeline_cast_to_slot_timeline :: proc(obj: RgbTimeline) -> SlotTimeline ---
	rotate_timeline_cast_to_bone_timeline1 :: proc(obj: RotateTimeline) -> BoneTimeline1 ---
	rotate_timeline_cast_to_curve_timeline1 :: proc(obj: RotateTimeline) -> CurveTimeline1 ---
	rotate_timeline_cast_to_curve_timeline :: proc(obj: RotateTimeline) -> CurveTimeline ---
	rotate_timeline_cast_to_timeline :: proc(obj: RotateTimeline) -> Timeline ---
	rotate_timeline_cast_to_bone_timeline :: proc(obj: RotateTimeline) -> BoneTimeline ---
	scale_timeline_cast_to_bone_timeline2 :: proc(obj: ScaleTimeline) -> BoneTimeline2 ---
	scale_timeline_cast_to_curve_timeline :: proc(obj: ScaleTimeline) -> CurveTimeline ---
	scale_timeline_cast_to_timeline :: proc(obj: ScaleTimeline) -> Timeline ---
	scale_timeline_cast_to_bone_timeline :: proc(obj: ScaleTimeline) -> BoneTimeline ---
	scale_x_timeline_cast_to_bone_timeline1 :: proc(obj: ScaleXTimeline) -> BoneTimeline1 ---
	scale_x_timeline_cast_to_curve_timeline1 :: proc(obj: ScaleXTimeline) -> CurveTimeline1 ---
	scale_x_timeline_cast_to_curve_timeline :: proc(obj: ScaleXTimeline) -> CurveTimeline ---
	scale_x_timeline_cast_to_timeline :: proc(obj: ScaleXTimeline) -> Timeline ---
	scale_x_timeline_cast_to_bone_timeline :: proc(obj: ScaleXTimeline) -> BoneTimeline ---
	scale_y_timeline_cast_to_bone_timeline1 :: proc(obj: ScaleYTimeline) -> BoneTimeline1 ---
	scale_y_timeline_cast_to_curve_timeline1 :: proc(obj: ScaleYTimeline) -> CurveTimeline1 ---
	scale_y_timeline_cast_to_curve_timeline :: proc(obj: ScaleYTimeline) -> CurveTimeline ---
	scale_y_timeline_cast_to_timeline :: proc(obj: ScaleYTimeline) -> Timeline ---
	scale_y_timeline_cast_to_bone_timeline :: proc(obj: ScaleYTimeline) -> BoneTimeline ---
	sequence_timeline_cast_to_timeline :: proc(obj: SequenceTimeline) -> Timeline ---
	sequence_timeline_cast_to_slot_timeline :: proc(obj: SequenceTimeline) -> SlotTimeline ---
	shear_timeline_cast_to_bone_timeline2 :: proc(obj: ShearTimeline) -> BoneTimeline2 ---
	shear_timeline_cast_to_curve_timeline :: proc(obj: ShearTimeline) -> CurveTimeline ---
	shear_timeline_cast_to_timeline :: proc(obj: ShearTimeline) -> Timeline ---
	shear_timeline_cast_to_bone_timeline :: proc(obj: ShearTimeline) -> BoneTimeline ---
	shear_x_timeline_cast_to_bone_timeline1 :: proc(obj: ShearXTimeline) -> BoneTimeline1 ---
	shear_x_timeline_cast_to_curve_timeline1 :: proc(obj: ShearXTimeline) -> CurveTimeline1 ---
	shear_x_timeline_cast_to_curve_timeline :: proc(obj: ShearXTimeline) -> CurveTimeline ---
	shear_x_timeline_cast_to_timeline :: proc(obj: ShearXTimeline) -> Timeline ---
	shear_x_timeline_cast_to_bone_timeline :: proc(obj: ShearXTimeline) -> BoneTimeline ---
	shear_y_timeline_cast_to_bone_timeline1 :: proc(obj: ShearYTimeline) -> BoneTimeline1 ---
	shear_y_timeline_cast_to_curve_timeline1 :: proc(obj: ShearYTimeline) -> CurveTimeline1 ---
	shear_y_timeline_cast_to_curve_timeline :: proc(obj: ShearYTimeline) -> CurveTimeline ---
	shear_y_timeline_cast_to_timeline :: proc(obj: ShearYTimeline) -> Timeline ---
	shear_y_timeline_cast_to_bone_timeline :: proc(obj: ShearYTimeline) -> BoneTimeline ---
	slider_cast_to_slider_base :: proc(obj: Slider) -> SliderBase ---
	slider_cast_to_posed :: proc(obj: Slider) -> Posed ---
	slider_cast_to_posed_active :: proc(obj: Slider) -> PosedActive ---
	slider_cast_to_constraint :: proc(obj: Slider) -> Constraint ---
	slider_cast_to_update :: proc(obj: Slider) -> Update ---
	slider_base_cast_to_posed :: proc(obj: SliderBase) -> Posed ---
	slider_base_cast_to_posed_active :: proc(obj: SliderBase) -> PosedActive ---
	slider_base_cast_to_constraint :: proc(obj: SliderBase) -> Constraint ---
	slider_base_cast_to_update :: proc(obj: SliderBase) -> Update ---
	slider_data_cast_to_posed_data :: proc(obj: SliderData) -> PosedData ---
	slider_data_cast_to_constraint_data :: proc(obj: SliderData) -> ConstraintData ---
	slider_mix_timeline_cast_to_constraint_timeline1 :: proc(obj: SliderMixTimeline) -> ConstraintTimeline1 ---
	slider_mix_timeline_cast_to_curve_timeline1 :: proc(obj: SliderMixTimeline) -> CurveTimeline1 ---
	slider_mix_timeline_cast_to_curve_timeline :: proc(obj: SliderMixTimeline) -> CurveTimeline ---
	slider_mix_timeline_cast_to_timeline :: proc(obj: SliderMixTimeline) -> Timeline ---
	slider_mix_timeline_cast_to_constraint_timeline :: proc(obj: SliderMixTimeline) -> ConstraintTimeline ---
	slider_timeline_cast_to_constraint_timeline1 :: proc(obj: SliderTimeline) -> ConstraintTimeline1 ---
	slider_timeline_cast_to_curve_timeline1 :: proc(obj: SliderTimeline) -> CurveTimeline1 ---
	slider_timeline_cast_to_curve_timeline :: proc(obj: SliderTimeline) -> CurveTimeline ---
	slider_timeline_cast_to_timeline :: proc(obj: SliderTimeline) -> Timeline ---
	slider_timeline_cast_to_constraint_timeline :: proc(obj: SliderTimeline) -> ConstraintTimeline ---
	slot_cast_to_posed :: proc(obj: Slot) -> Posed ---
	slot_curve_timeline_cast_to_curve_timeline :: proc(obj: SlotCurveTimeline) -> CurveTimeline ---
	slot_curve_timeline_cast_to_timeline :: proc(obj: SlotCurveTimeline) -> Timeline ---
	slot_curve_timeline_cast_to_slot_timeline :: proc(obj: SlotCurveTimeline) -> SlotTimeline ---
	slot_data_cast_to_posed_data :: proc(obj: SlotData) -> PosedData ---
	to_rotate_cast_to_to_property :: proc(obj: ToRotate) -> ToProperty ---
	to_scale_x_cast_to_to_property :: proc(obj: ToScaleX) -> ToProperty ---
	to_scale_y_cast_to_to_property :: proc(obj: ToScaleY) -> ToProperty ---
	to_shear_y_cast_to_to_property :: proc(obj: ToShearY) -> ToProperty ---
	to_x_cast_to_to_property :: proc(obj: ToX) -> ToProperty ---
	to_y_cast_to_to_property :: proc(obj: ToY) -> ToProperty ---
	transform_constraint_cast_to_transform_constraint_base :: proc(obj: TransformConstraint) -> TransformConstraintBase ---
	transform_constraint_cast_to_posed :: proc(obj: TransformConstraint) -> Posed ---
	transform_constraint_cast_to_posed_active :: proc(obj: TransformConstraint) -> PosedActive ---
	transform_constraint_cast_to_constraint :: proc(obj: TransformConstraint) -> Constraint ---
	transform_constraint_cast_to_update :: proc(obj: TransformConstraint) -> Update ---
	transform_constraint_base_cast_to_posed :: proc(obj: TransformConstraintBase) -> Posed ---
	transform_constraint_base_cast_to_posed_active :: proc(obj: TransformConstraintBase) -> PosedActive ---
	transform_constraint_base_cast_to_constraint :: proc(obj: TransformConstraintBase) -> Constraint ---
	transform_constraint_base_cast_to_update :: proc(obj: TransformConstraintBase) -> Update ---
	transform_constraint_data_cast_to_posed_data :: proc(obj: TransformConstraintData) -> PosedData ---
	transform_constraint_data_cast_to_constraint_data :: proc(obj: TransformConstraintData) -> ConstraintData ---
	transform_constraint_timeline_cast_to_curve_timeline :: proc(obj: TransformConstraintTimeline) -> CurveTimeline ---
	transform_constraint_timeline_cast_to_timeline :: proc(obj: TransformConstraintTimeline) -> Timeline ---
	transform_constraint_timeline_cast_to_constraint_timeline :: proc(obj: TransformConstraintTimeline) -> ConstraintTimeline ---
	translate_timeline_cast_to_bone_timeline2 :: proc(obj: TranslateTimeline) -> BoneTimeline2 ---
	translate_timeline_cast_to_curve_timeline :: proc(obj: TranslateTimeline) -> CurveTimeline ---
	translate_timeline_cast_to_timeline :: proc(obj: TranslateTimeline) -> Timeline ---
	translate_timeline_cast_to_bone_timeline :: proc(obj: TranslateTimeline) -> BoneTimeline ---
	translate_x_timeline_cast_to_bone_timeline1 :: proc(obj: TranslateXTimeline) -> BoneTimeline1 ---
	translate_x_timeline_cast_to_curve_timeline1 :: proc(obj: TranslateXTimeline) -> CurveTimeline1 ---
	translate_x_timeline_cast_to_curve_timeline :: proc(obj: TranslateXTimeline) -> CurveTimeline ---
	translate_x_timeline_cast_to_timeline :: proc(obj: TranslateXTimeline) -> Timeline ---
	translate_x_timeline_cast_to_bone_timeline :: proc(obj: TranslateXTimeline) -> BoneTimeline ---
	translate_y_timeline_cast_to_bone_timeline1 :: proc(obj: TranslateYTimeline) -> BoneTimeline1 ---
	translate_y_timeline_cast_to_curve_timeline1 :: proc(obj: TranslateYTimeline) -> CurveTimeline1 ---
	translate_y_timeline_cast_to_curve_timeline :: proc(obj: TranslateYTimeline) -> CurveTimeline ---
	translate_y_timeline_cast_to_timeline :: proc(obj: TranslateYTimeline) -> Timeline ---
	translate_y_timeline_cast_to_bone_timeline :: proc(obj: TranslateYTimeline) -> BoneTimeline ---
	vertex_attachment_cast_to_attachment :: proc(obj: VertexAttachment) -> Attachment ---
	curve_timeline1_cast_to_alpha_timeline :: proc(obj: CurveTimeline1) -> AlphaTimeline ---
	curve_timeline1_cast_to_bone_timeline1 :: proc(obj: CurveTimeline1) -> BoneTimeline1 ---
	curve_timeline1_cast_to_constraint_timeline1 :: proc(obj: CurveTimeline1) -> ConstraintTimeline1 ---
	curve_timeline1_cast_to_path_constraint_position_timeline :: proc(obj: CurveTimeline1) -> PathConstraintPositionTimeline ---
	curve_timeline1_cast_to_path_constraint_spacing_timeline :: proc(obj: CurveTimeline1) -> PathConstraintSpacingTimeline ---
	curve_timeline1_cast_to_physics_constraint_damping_timeline :: proc(obj: CurveTimeline1) -> PhysicsConstraintDampingTimeline ---
	curve_timeline1_cast_to_physics_constraint_gravity_timeline :: proc(obj: CurveTimeline1) -> PhysicsConstraintGravityTimeline ---
	curve_timeline1_cast_to_physics_constraint_inertia_timeline :: proc(obj: CurveTimeline1) -> PhysicsConstraintInertiaTimeline ---
	curve_timeline1_cast_to_physics_constraint_mass_timeline :: proc(obj: CurveTimeline1) -> PhysicsConstraintMassTimeline ---
	curve_timeline1_cast_to_physics_constraint_mix_timeline :: proc(obj: CurveTimeline1) -> PhysicsConstraintMixTimeline ---
	curve_timeline1_cast_to_physics_constraint_strength_timeline :: proc(obj: CurveTimeline1) -> PhysicsConstraintStrengthTimeline ---
	curve_timeline1_cast_to_physics_constraint_timeline :: proc(obj: CurveTimeline1) -> PhysicsConstraintTimeline ---
	curve_timeline1_cast_to_physics_constraint_wind_timeline :: proc(obj: CurveTimeline1) -> PhysicsConstraintWindTimeline ---
	curve_timeline1_cast_to_rotate_timeline :: proc(obj: CurveTimeline1) -> RotateTimeline ---
	curve_timeline1_cast_to_scale_x_timeline :: proc(obj: CurveTimeline1) -> ScaleXTimeline ---
	curve_timeline1_cast_to_scale_y_timeline :: proc(obj: CurveTimeline1) -> ScaleYTimeline ---
	curve_timeline1_cast_to_shear_x_timeline :: proc(obj: CurveTimeline1) -> ShearXTimeline ---
	curve_timeline1_cast_to_shear_y_timeline :: proc(obj: CurveTimeline1) -> ShearYTimeline ---
	curve_timeline1_cast_to_slider_mix_timeline :: proc(obj: CurveTimeline1) -> SliderMixTimeline ---
	curve_timeline1_cast_to_slider_timeline :: proc(obj: CurveTimeline1) -> SliderTimeline ---
	curve_timeline1_cast_to_translate_x_timeline :: proc(obj: CurveTimeline1) -> TranslateXTimeline ---
	curve_timeline1_cast_to_translate_y_timeline :: proc(obj: CurveTimeline1) -> TranslateYTimeline ---
	curve_timeline_cast_to_alpha_timeline :: proc(obj: CurveTimeline) -> AlphaTimeline ---
	curve_timeline_cast_to_bone_timeline1 :: proc(obj: CurveTimeline) -> BoneTimeline1 ---
	curve_timeline_cast_to_bone_timeline2 :: proc(obj: CurveTimeline) -> BoneTimeline2 ---
	curve_timeline_cast_to_constraint_timeline1 :: proc(obj: CurveTimeline) -> ConstraintTimeline1 ---
	curve_timeline_cast_to_curve_timeline1 :: proc(obj: CurveTimeline) -> CurveTimeline1 ---
	curve_timeline_cast_to_deform_timeline :: proc(obj: CurveTimeline) -> DeformTimeline ---
	curve_timeline_cast_to_ik_constraint_timeline :: proc(obj: CurveTimeline) -> IkConstraintTimeline ---
	curve_timeline_cast_to_path_constraint_mix_timeline :: proc(obj: CurveTimeline) -> PathConstraintMixTimeline ---
	curve_timeline_cast_to_path_constraint_position_timeline :: proc(obj: CurveTimeline) -> PathConstraintPositionTimeline ---
	curve_timeline_cast_to_path_constraint_spacing_timeline :: proc(obj: CurveTimeline) -> PathConstraintSpacingTimeline ---
	curve_timeline_cast_to_physics_constraint_damping_timeline :: proc(obj: CurveTimeline) -> PhysicsConstraintDampingTimeline ---
	curve_timeline_cast_to_physics_constraint_gravity_timeline :: proc(obj: CurveTimeline) -> PhysicsConstraintGravityTimeline ---
	curve_timeline_cast_to_physics_constraint_inertia_timeline :: proc(obj: CurveTimeline) -> PhysicsConstraintInertiaTimeline ---
	curve_timeline_cast_to_physics_constraint_mass_timeline :: proc(obj: CurveTimeline) -> PhysicsConstraintMassTimeline ---
	curve_timeline_cast_to_physics_constraint_mix_timeline :: proc(obj: CurveTimeline) -> PhysicsConstraintMixTimeline ---
	curve_timeline_cast_to_physics_constraint_strength_timeline :: proc(obj: CurveTimeline) -> PhysicsConstraintStrengthTimeline ---
	curve_timeline_cast_to_physics_constraint_timeline :: proc(obj: CurveTimeline) -> PhysicsConstraintTimeline ---
	curve_timeline_cast_to_physics_constraint_wind_timeline :: proc(obj: CurveTimeline) -> PhysicsConstraintWindTimeline ---
	curve_timeline_cast_to_rgb2_timeline :: proc(obj: CurveTimeline) -> Rgb2Timeline ---
	curve_timeline_cast_to_rgba2_timeline :: proc(obj: CurveTimeline) -> Rgba2Timeline ---
	curve_timeline_cast_to_rgba_timeline :: proc(obj: CurveTimeline) -> RgbaTimeline ---
	curve_timeline_cast_to_rgb_timeline :: proc(obj: CurveTimeline) -> RgbTimeline ---
	curve_timeline_cast_to_rotate_timeline :: proc(obj: CurveTimeline) -> RotateTimeline ---
	curve_timeline_cast_to_scale_timeline :: proc(obj: CurveTimeline) -> ScaleTimeline ---
	curve_timeline_cast_to_scale_x_timeline :: proc(obj: CurveTimeline) -> ScaleXTimeline ---
	curve_timeline_cast_to_scale_y_timeline :: proc(obj: CurveTimeline) -> ScaleYTimeline ---
	curve_timeline_cast_to_shear_timeline :: proc(obj: CurveTimeline) -> ShearTimeline ---
	curve_timeline_cast_to_shear_x_timeline :: proc(obj: CurveTimeline) -> ShearXTimeline ---
	curve_timeline_cast_to_shear_y_timeline :: proc(obj: CurveTimeline) -> ShearYTimeline ---
	curve_timeline_cast_to_slider_mix_timeline :: proc(obj: CurveTimeline) -> SliderMixTimeline ---
	curve_timeline_cast_to_slider_timeline :: proc(obj: CurveTimeline) -> SliderTimeline ---
	curve_timeline_cast_to_slot_curve_timeline :: proc(obj: CurveTimeline) -> SlotCurveTimeline ---
	curve_timeline_cast_to_transform_constraint_timeline :: proc(obj: CurveTimeline) -> TransformConstraintTimeline ---
	curve_timeline_cast_to_translate_timeline :: proc(obj: CurveTimeline) -> TranslateTimeline ---
	curve_timeline_cast_to_translate_x_timeline :: proc(obj: CurveTimeline) -> TranslateXTimeline ---
	curve_timeline_cast_to_translate_y_timeline :: proc(obj: CurveTimeline) -> TranslateYTimeline ---
	timeline_cast_to_alpha_timeline :: proc(obj: Timeline) -> AlphaTimeline ---
	timeline_cast_to_attachment_timeline :: proc(obj: Timeline) -> AttachmentTimeline ---
	timeline_cast_to_bone_timeline1 :: proc(obj: Timeline) -> BoneTimeline1 ---
	timeline_cast_to_bone_timeline2 :: proc(obj: Timeline) -> BoneTimeline2 ---
	timeline_cast_to_constraint_timeline1 :: proc(obj: Timeline) -> ConstraintTimeline1 ---
	timeline_cast_to_curve_timeline :: proc(obj: Timeline) -> CurveTimeline ---
	timeline_cast_to_curve_timeline1 :: proc(obj: Timeline) -> CurveTimeline1 ---
	timeline_cast_to_deform_timeline :: proc(obj: Timeline) -> DeformTimeline ---
	timeline_cast_to_draw_order_folder_timeline :: proc(obj: Timeline) -> DrawOrderFolderTimeline ---
	timeline_cast_to_draw_order_timeline :: proc(obj: Timeline) -> DrawOrderTimeline ---
	timeline_cast_to_event_timeline :: proc(obj: Timeline) -> EventTimeline ---
	timeline_cast_to_ik_constraint_timeline :: proc(obj: Timeline) -> IkConstraintTimeline ---
	timeline_cast_to_inherit_timeline :: proc(obj: Timeline) -> InheritTimeline ---
	timeline_cast_to_path_constraint_mix_timeline :: proc(obj: Timeline) -> PathConstraintMixTimeline ---
	timeline_cast_to_path_constraint_position_timeline :: proc(obj: Timeline) -> PathConstraintPositionTimeline ---
	timeline_cast_to_path_constraint_spacing_timeline :: proc(obj: Timeline) -> PathConstraintSpacingTimeline ---
	timeline_cast_to_physics_constraint_damping_timeline :: proc(obj: Timeline) -> PhysicsConstraintDampingTimeline ---
	timeline_cast_to_physics_constraint_gravity_timeline :: proc(obj: Timeline) -> PhysicsConstraintGravityTimeline ---
	timeline_cast_to_physics_constraint_inertia_timeline :: proc(obj: Timeline) -> PhysicsConstraintInertiaTimeline ---
	timeline_cast_to_physics_constraint_mass_timeline :: proc(obj: Timeline) -> PhysicsConstraintMassTimeline ---
	timeline_cast_to_physics_constraint_mix_timeline :: proc(obj: Timeline) -> PhysicsConstraintMixTimeline ---
	timeline_cast_to_physics_constraint_reset_timeline :: proc(obj: Timeline) -> PhysicsConstraintResetTimeline ---
	timeline_cast_to_physics_constraint_strength_timeline :: proc(obj: Timeline) -> PhysicsConstraintStrengthTimeline ---
	timeline_cast_to_physics_constraint_timeline :: proc(obj: Timeline) -> PhysicsConstraintTimeline ---
	timeline_cast_to_physics_constraint_wind_timeline :: proc(obj: Timeline) -> PhysicsConstraintWindTimeline ---
	timeline_cast_to_rgb2_timeline :: proc(obj: Timeline) -> Rgb2Timeline ---
	timeline_cast_to_rgba2_timeline :: proc(obj: Timeline) -> Rgba2Timeline ---
	timeline_cast_to_rgba_timeline :: proc(obj: Timeline) -> RgbaTimeline ---
	timeline_cast_to_rgb_timeline :: proc(obj: Timeline) -> RgbTimeline ---
	timeline_cast_to_rotate_timeline :: proc(obj: Timeline) -> RotateTimeline ---
	timeline_cast_to_scale_timeline :: proc(obj: Timeline) -> ScaleTimeline ---
	timeline_cast_to_scale_x_timeline :: proc(obj: Timeline) -> ScaleXTimeline ---
	timeline_cast_to_scale_y_timeline :: proc(obj: Timeline) -> ScaleYTimeline ---
	timeline_cast_to_sequence_timeline :: proc(obj: Timeline) -> SequenceTimeline ---
	timeline_cast_to_shear_timeline :: proc(obj: Timeline) -> ShearTimeline ---
	timeline_cast_to_shear_x_timeline :: proc(obj: Timeline) -> ShearXTimeline ---
	timeline_cast_to_shear_y_timeline :: proc(obj: Timeline) -> ShearYTimeline ---
	timeline_cast_to_slider_mix_timeline :: proc(obj: Timeline) -> SliderMixTimeline ---
	timeline_cast_to_slider_timeline :: proc(obj: Timeline) -> SliderTimeline ---
	timeline_cast_to_slot_curve_timeline :: proc(obj: Timeline) -> SlotCurveTimeline ---
	timeline_cast_to_transform_constraint_timeline :: proc(obj: Timeline) -> TransformConstraintTimeline ---
	timeline_cast_to_translate_timeline :: proc(obj: Timeline) -> TranslateTimeline ---
	timeline_cast_to_translate_x_timeline :: proc(obj: Timeline) -> TranslateXTimeline ---
	timeline_cast_to_translate_y_timeline :: proc(obj: Timeline) -> TranslateYTimeline ---
	slot_timeline_cast_to_alpha_timeline :: proc(obj: SlotTimeline) -> AlphaTimeline ---
	slot_timeline_cast_to_attachment_timeline :: proc(obj: SlotTimeline) -> AttachmentTimeline ---
	slot_timeline_cast_to_deform_timeline :: proc(obj: SlotTimeline) -> DeformTimeline ---
	slot_timeline_cast_to_rgb2_timeline :: proc(obj: SlotTimeline) -> Rgb2Timeline ---
	slot_timeline_cast_to_rgba2_timeline :: proc(obj: SlotTimeline) -> Rgba2Timeline ---
	slot_timeline_cast_to_rgba_timeline :: proc(obj: SlotTimeline) -> RgbaTimeline ---
	slot_timeline_cast_to_rgb_timeline :: proc(obj: SlotTimeline) -> RgbTimeline ---
	slot_timeline_cast_to_sequence_timeline :: proc(obj: SlotTimeline) -> SequenceTimeline ---
	slot_timeline_cast_to_slot_curve_timeline :: proc(obj: SlotTimeline) -> SlotCurveTimeline ---
	attachment_loader_cast_to_atlas_attachment_loader :: proc(obj: AttachmentLoader) -> AtlasAttachmentLoader ---
	texture_region_cast_to_atlas_region :: proc(obj: TextureRegion) -> AtlasRegion ---
	posed_cast_to_bone :: proc(obj: Posed) -> Bone ---
	posed_cast_to_ik_constraint :: proc(obj: Posed) -> IkConstraint ---
	posed_cast_to_ik_constraint_base :: proc(obj: Posed) -> IkConstraintBase ---
	posed_cast_to_path_constraint :: proc(obj: Posed) -> PathConstraint ---
	posed_cast_to_path_constraint_base :: proc(obj: Posed) -> PathConstraintBase ---
	posed_cast_to_physics_constraint :: proc(obj: Posed) -> PhysicsConstraint ---
	posed_cast_to_physics_constraint_base :: proc(obj: Posed) -> PhysicsConstraintBase ---
	posed_cast_to_slider :: proc(obj: Posed) -> Slider ---
	posed_cast_to_slider_base :: proc(obj: Posed) -> SliderBase ---
	posed_cast_to_slot :: proc(obj: Posed) -> Slot ---
	posed_cast_to_transform_constraint :: proc(obj: Posed) -> TransformConstraint ---
	posed_cast_to_transform_constraint_base :: proc(obj: Posed) -> TransformConstraintBase ---
	posed_active_cast_to_bone :: proc(obj: PosedActive) -> Bone ---
	posed_active_cast_to_ik_constraint :: proc(obj: PosedActive) -> IkConstraint ---
	posed_active_cast_to_ik_constraint_base :: proc(obj: PosedActive) -> IkConstraintBase ---
	posed_active_cast_to_path_constraint :: proc(obj: PosedActive) -> PathConstraint ---
	posed_active_cast_to_path_constraint_base :: proc(obj: PosedActive) -> PathConstraintBase ---
	posed_active_cast_to_physics_constraint :: proc(obj: PosedActive) -> PhysicsConstraint ---
	posed_active_cast_to_physics_constraint_base :: proc(obj: PosedActive) -> PhysicsConstraintBase ---
	posed_active_cast_to_slider :: proc(obj: PosedActive) -> Slider ---
	posed_active_cast_to_slider_base :: proc(obj: PosedActive) -> SliderBase ---
	posed_active_cast_to_transform_constraint :: proc(obj: PosedActive) -> TransformConstraint ---
	posed_active_cast_to_transform_constraint_base :: proc(obj: PosedActive) -> TransformConstraintBase ---
	update_cast_to_bone :: proc(obj: Update) -> Bone ---
	update_cast_to_bone_pose :: proc(obj: Update) -> BonePose ---
	update_cast_to_constraint :: proc(obj: Update) -> Constraint ---
	update_cast_to_ik_constraint :: proc(obj: Update) -> IkConstraint ---
	update_cast_to_ik_constraint_base :: proc(obj: Update) -> IkConstraintBase ---
	update_cast_to_path_constraint :: proc(obj: Update) -> PathConstraint ---
	update_cast_to_path_constraint_base :: proc(obj: Update) -> PathConstraintBase ---
	update_cast_to_physics_constraint :: proc(obj: Update) -> PhysicsConstraint ---
	update_cast_to_physics_constraint_base :: proc(obj: Update) -> PhysicsConstraintBase ---
	update_cast_to_slider :: proc(obj: Update) -> Slider ---
	update_cast_to_slider_base :: proc(obj: Update) -> SliderBase ---
	update_cast_to_transform_constraint :: proc(obj: Update) -> TransformConstraint ---
	update_cast_to_transform_constraint_base :: proc(obj: Update) -> TransformConstraintBase ---
	posed_data_cast_to_bone_data :: proc(obj: PosedData) -> BoneData ---
	posed_data_cast_to_ik_constraint_data :: proc(obj: PosedData) -> IkConstraintData ---
	posed_data_cast_to_path_constraint_data :: proc(obj: PosedData) -> PathConstraintData ---
	posed_data_cast_to_physics_constraint_data :: proc(obj: PosedData) -> PhysicsConstraintData ---
	posed_data_cast_to_slider_data :: proc(obj: PosedData) -> SliderData ---
	posed_data_cast_to_slot_data :: proc(obj: PosedData) -> SlotData ---
	posed_data_cast_to_transform_constraint_data :: proc(obj: PosedData) -> TransformConstraintData ---
	bone_local_cast_to_bone_pose :: proc(obj: BoneLocal) -> BonePose ---
	bone_timeline_cast_to_bone_timeline1 :: proc(obj: BoneTimeline) -> BoneTimeline1 ---
	bone_timeline_cast_to_bone_timeline2 :: proc(obj: BoneTimeline) -> BoneTimeline2 ---
	bone_timeline_cast_to_inherit_timeline :: proc(obj: BoneTimeline) -> InheritTimeline ---
	bone_timeline_cast_to_rotate_timeline :: proc(obj: BoneTimeline) -> RotateTimeline ---
	bone_timeline_cast_to_scale_timeline :: proc(obj: BoneTimeline) -> ScaleTimeline ---
	bone_timeline_cast_to_scale_x_timeline :: proc(obj: BoneTimeline) -> ScaleXTimeline ---
	bone_timeline_cast_to_scale_y_timeline :: proc(obj: BoneTimeline) -> ScaleYTimeline ---
	bone_timeline_cast_to_shear_timeline :: proc(obj: BoneTimeline) -> ShearTimeline ---
	bone_timeline_cast_to_shear_x_timeline :: proc(obj: BoneTimeline) -> ShearXTimeline ---
	bone_timeline_cast_to_shear_y_timeline :: proc(obj: BoneTimeline) -> ShearYTimeline ---
	bone_timeline_cast_to_translate_timeline :: proc(obj: BoneTimeline) -> TranslateTimeline ---
	bone_timeline_cast_to_translate_x_timeline :: proc(obj: BoneTimeline) -> TranslateXTimeline ---
	bone_timeline_cast_to_translate_y_timeline :: proc(obj: BoneTimeline) -> TranslateYTimeline ---
	vertex_attachment_cast_to_bounding_box_attachment :: proc(obj: VertexAttachment) -> BoundingBoxAttachment ---
	vertex_attachment_cast_to_clipping_attachment :: proc(obj: VertexAttachment) -> ClippingAttachment ---
	vertex_attachment_cast_to_mesh_attachment :: proc(obj: VertexAttachment) -> MeshAttachment ---
	vertex_attachment_cast_to_path_attachment :: proc(obj: VertexAttachment) -> PathAttachment ---
	attachment_cast_to_bounding_box_attachment :: proc(obj: Attachment) -> BoundingBoxAttachment ---
	attachment_cast_to_clipping_attachment :: proc(obj: Attachment) -> ClippingAttachment ---
	attachment_cast_to_mesh_attachment :: proc(obj: Attachment) -> MeshAttachment ---
	attachment_cast_to_path_attachment :: proc(obj: Attachment) -> PathAttachment ---
	attachment_cast_to_point_attachment :: proc(obj: Attachment) -> PointAttachment ---
	attachment_cast_to_region_attachment :: proc(obj: Attachment) -> RegionAttachment ---
	attachment_cast_to_vertex_attachment :: proc(obj: Attachment) -> VertexAttachment ---
	constraint_timeline_cast_to_constraint_timeline1 :: proc(obj: ConstraintTimeline) -> ConstraintTimeline1 ---
	constraint_timeline_cast_to_ik_constraint_timeline :: proc(obj: ConstraintTimeline) -> IkConstraintTimeline ---
	constraint_timeline_cast_to_path_constraint_mix_timeline :: proc(obj: ConstraintTimeline) -> PathConstraintMixTimeline ---
	constraint_timeline_cast_to_path_constraint_position_timeline :: proc(obj: ConstraintTimeline) -> PathConstraintPositionTimeline ---
	constraint_timeline_cast_to_path_constraint_spacing_timeline :: proc(obj: ConstraintTimeline) -> PathConstraintSpacingTimeline ---
	constraint_timeline_cast_to_physics_constraint_damping_timeline :: proc(obj: ConstraintTimeline) -> PhysicsConstraintDampingTimeline ---
	constraint_timeline_cast_to_physics_constraint_gravity_timeline :: proc(obj: ConstraintTimeline) -> PhysicsConstraintGravityTimeline ---
	constraint_timeline_cast_to_physics_constraint_inertia_timeline :: proc(obj: ConstraintTimeline) -> PhysicsConstraintInertiaTimeline ---
	constraint_timeline_cast_to_physics_constraint_mass_timeline :: proc(obj: ConstraintTimeline) -> PhysicsConstraintMassTimeline ---
	constraint_timeline_cast_to_physics_constraint_mix_timeline :: proc(obj: ConstraintTimeline) -> PhysicsConstraintMixTimeline ---
	constraint_timeline_cast_to_physics_constraint_reset_timeline :: proc(obj: ConstraintTimeline) -> PhysicsConstraintResetTimeline ---
	constraint_timeline_cast_to_physics_constraint_strength_timeline :: proc(obj: ConstraintTimeline) -> PhysicsConstraintStrengthTimeline ---
	constraint_timeline_cast_to_physics_constraint_timeline :: proc(obj: ConstraintTimeline) -> PhysicsConstraintTimeline ---
	constraint_timeline_cast_to_physics_constraint_wind_timeline :: proc(obj: ConstraintTimeline) -> PhysicsConstraintWindTimeline ---
	constraint_timeline_cast_to_slider_mix_timeline :: proc(obj: ConstraintTimeline) -> SliderMixTimeline ---
	constraint_timeline_cast_to_slider_timeline :: proc(obj: ConstraintTimeline) -> SliderTimeline ---
	constraint_timeline_cast_to_transform_constraint_timeline :: proc(obj: ConstraintTimeline) -> TransformConstraintTimeline ---
	slot_curve_timeline_cast_to_deform_timeline :: proc(obj: SlotCurveTimeline) -> DeformTimeline ---
	slot_curve_timeline_cast_to_rgb2_timeline :: proc(obj: SlotCurveTimeline) -> Rgb2Timeline ---
	slot_curve_timeline_cast_to_rgba2_timeline :: proc(obj: SlotCurveTimeline) -> Rgba2Timeline ---
	slot_curve_timeline_cast_to_rgba_timeline :: proc(obj: SlotCurveTimeline) -> RgbaTimeline ---
	slot_curve_timeline_cast_to_rgb_timeline :: proc(obj: SlotCurveTimeline) -> RgbTimeline ---
	from_property_cast_to_from_rotate :: proc(obj: FromProperty) -> FromRotate ---
	from_property_cast_to_from_scale_x :: proc(obj: FromProperty) -> FromScaleX ---
	from_property_cast_to_from_scale_y :: proc(obj: FromProperty) -> FromScaleY ---
	from_property_cast_to_from_shear_y :: proc(obj: FromProperty) -> FromShearY ---
	from_property_cast_to_from_x :: proc(obj: FromProperty) -> FromX ---
	from_property_cast_to_from_y :: proc(obj: FromProperty) -> FromY ---
	ik_constraint_base_cast_to_ik_constraint :: proc(obj: IkConstraintBase) -> IkConstraint ---
	constraint_cast_to_ik_constraint :: proc(obj: Constraint) -> IkConstraint ---
	constraint_cast_to_ik_constraint_base :: proc(obj: Constraint) -> IkConstraintBase ---
	constraint_cast_to_path_constraint :: proc(obj: Constraint) -> PathConstraint ---
	constraint_cast_to_path_constraint_base :: proc(obj: Constraint) -> PathConstraintBase ---
	constraint_cast_to_physics_constraint :: proc(obj: Constraint) -> PhysicsConstraint ---
	constraint_cast_to_physics_constraint_base :: proc(obj: Constraint) -> PhysicsConstraintBase ---
	constraint_cast_to_slider :: proc(obj: Constraint) -> Slider ---
	constraint_cast_to_slider_base :: proc(obj: Constraint) -> SliderBase ---
	constraint_cast_to_transform_constraint :: proc(obj: Constraint) -> TransformConstraint ---
	constraint_cast_to_transform_constraint_base :: proc(obj: Constraint) -> TransformConstraintBase ---
	constraint_data_cast_to_ik_constraint_data :: proc(obj: ConstraintData) -> IkConstraintData ---
	constraint_data_cast_to_path_constraint_data :: proc(obj: ConstraintData) -> PathConstraintData ---
	constraint_data_cast_to_physics_constraint_data :: proc(obj: ConstraintData) -> PhysicsConstraintData ---
	constraint_data_cast_to_slider_data :: proc(obj: ConstraintData) -> SliderData ---
	constraint_data_cast_to_transform_constraint_data :: proc(obj: ConstraintData) -> TransformConstraintData ---
	path_constraint_base_cast_to_path_constraint :: proc(obj: PathConstraintBase) -> PathConstraint ---
	constraint_timeline1_cast_to_path_constraint_position_timeline :: proc(obj: ConstraintTimeline1) -> PathConstraintPositionTimeline ---
	constraint_timeline1_cast_to_path_constraint_spacing_timeline :: proc(obj: ConstraintTimeline1) -> PathConstraintSpacingTimeline ---
	constraint_timeline1_cast_to_slider_mix_timeline :: proc(obj: ConstraintTimeline1) -> SliderMixTimeline ---
	constraint_timeline1_cast_to_slider_timeline :: proc(obj: ConstraintTimeline1) -> SliderTimeline ---
	physics_constraint_base_cast_to_physics_constraint :: proc(obj: PhysicsConstraintBase) -> PhysicsConstraint ---
	physics_constraint_timeline_cast_to_physics_constraint_damping_timeline :: proc(obj: PhysicsConstraintTimeline) -> PhysicsConstraintDampingTimeline ---
	physics_constraint_timeline_cast_to_physics_constraint_gravity_timeline :: proc(obj: PhysicsConstraintTimeline) -> PhysicsConstraintGravityTimeline ---
	physics_constraint_timeline_cast_to_physics_constraint_inertia_timeline :: proc(obj: PhysicsConstraintTimeline) -> PhysicsConstraintInertiaTimeline ---
	physics_constraint_timeline_cast_to_physics_constraint_mass_timeline :: proc(obj: PhysicsConstraintTimeline) -> PhysicsConstraintMassTimeline ---
	physics_constraint_timeline_cast_to_physics_constraint_mix_timeline :: proc(obj: PhysicsConstraintTimeline) -> PhysicsConstraintMixTimeline ---
	physics_constraint_timeline_cast_to_physics_constraint_strength_timeline :: proc(obj: PhysicsConstraintTimeline) -> PhysicsConstraintStrengthTimeline ---
	physics_constraint_timeline_cast_to_physics_constraint_wind_timeline :: proc(obj: PhysicsConstraintTimeline) -> PhysicsConstraintWindTimeline ---
	bone_timeline1_cast_to_rotate_timeline :: proc(obj: BoneTimeline1) -> RotateTimeline ---
	bone_timeline1_cast_to_scale_x_timeline :: proc(obj: BoneTimeline1) -> ScaleXTimeline ---
	bone_timeline1_cast_to_scale_y_timeline :: proc(obj: BoneTimeline1) -> ScaleYTimeline ---
	bone_timeline1_cast_to_shear_x_timeline :: proc(obj: BoneTimeline1) -> ShearXTimeline ---
	bone_timeline1_cast_to_shear_y_timeline :: proc(obj: BoneTimeline1) -> ShearYTimeline ---
	bone_timeline1_cast_to_translate_x_timeline :: proc(obj: BoneTimeline1) -> TranslateXTimeline ---
	bone_timeline1_cast_to_translate_y_timeline :: proc(obj: BoneTimeline1) -> TranslateYTimeline ---
	bone_timeline2_cast_to_scale_timeline :: proc(obj: BoneTimeline2) -> ScaleTimeline ---
	bone_timeline2_cast_to_shear_timeline :: proc(obj: BoneTimeline2) -> ShearTimeline ---
	bone_timeline2_cast_to_translate_timeline :: proc(obj: BoneTimeline2) -> TranslateTimeline ---
	slider_base_cast_to_slider :: proc(obj: SliderBase) -> Slider ---
	to_property_cast_to_to_rotate :: proc(obj: ToProperty) -> ToRotate ---
	to_property_cast_to_to_scale_x :: proc(obj: ToProperty) -> ToScaleX ---
	to_property_cast_to_to_scale_y :: proc(obj: ToProperty) -> ToScaleY ---
	to_property_cast_to_to_shear_y :: proc(obj: ToProperty) -> ToShearY ---
	to_property_cast_to_to_x :: proc(obj: ToProperty) -> ToX ---
	to_property_cast_to_to_y :: proc(obj: ToProperty) -> ToY ---
	transform_constraint_base_cast_to_transform_constraint :: proc(obj: TransformConstraintBase) -> TransformConstraint ---
	clipping_attachment_create :: proc(name: cstring) -> ClippingAttachment ---
	clipping_attachment_dispose :: proc(self: ClippingAttachment) ---
	clipping_attachment_get_rtti :: proc(self: ClippingAttachment) -> Rtti ---
	clipping_attachment_get_end_slot :: proc(self: ClippingAttachment) -> SlotData ---
	clipping_attachment_set_end_slot :: proc(self: ClippingAttachment, in_value: SlotData) ---
	clipping_attachment_get_convex :: proc(self: ClippingAttachment) -> c.bool ---
	clipping_attachment_set_convex :: proc(self: ClippingAttachment, convex: c.bool) ---
	clipping_attachment_get_inverse :: proc(self: ClippingAttachment) -> c.bool ---
	clipping_attachment_set_inverse :: proc(self: ClippingAttachment, inverse: c.bool) ---
	clipping_attachment_get_color :: proc(self: ClippingAttachment) -> Color ---
	clipping_attachment_copy :: proc(self: ClippingAttachment) -> Attachment ---
	clipping_attachment_compute_world_vertices_1 :: proc(self: ClippingAttachment, skeleton: Skeleton, slot: Slot, start: c.size_t, count: c.size_t, world_vertices: [^]c.float, offset: c.size_t, stride: c.size_t) ---
	clipping_attachment_compute_world_vertices_2 :: proc(self: ClippingAttachment, skeleton: Skeleton, slot: Slot, start: c.size_t, count: c.size_t, world_vertices: ArrayFloat, offset: c.size_t, stride: c.size_t) ---
	clipping_attachment_get_id :: proc(self: ClippingAttachment) -> c.int ---
	clipping_attachment_get_bones :: proc(self: ClippingAttachment) -> ArrayInt ---
	clipping_attachment_set_bones :: proc(self: ClippingAttachment, bones: ArrayInt) ---
	clipping_attachment_get_vertices :: proc(self: ClippingAttachment) -> ArrayFloat ---
	clipping_attachment_set_vertices :: proc(self: ClippingAttachment, vertices: ArrayFloat) ---
	clipping_attachment_get_world_vertices_length :: proc(self: ClippingAttachment) -> c.size_t ---
	clipping_attachment_set_world_vertices_length :: proc(self: ClippingAttachment, in_value: c.size_t) ---
	clipping_attachment_get_timeline_attachment :: proc(self: ClippingAttachment) -> Attachment ---
	clipping_attachment_set_timeline_attachment :: proc(self: ClippingAttachment, attachment: Attachment) ---
	clipping_attachment_copy_to :: proc(self: ClippingAttachment, other: VertexAttachment) ---
	clipping_attachment_get_name :: proc(self: ClippingAttachment) -> cstring ---
	clipping_attachment_get_timeline_slots :: proc(self: ClippingAttachment) -> ArrayInt ---
	clipping_attachment_set_timeline_slots :: proc(self: ClippingAttachment, timeline_slots: ArrayInt) ---
	clipping_attachment_is_timeline_active :: proc(self: ClippingAttachment, slots: ArraySlot, slot_index: c.int, applied_pose: c.bool) -> c.bool ---
	clipping_attachment_get_ref_count :: proc(self: ClippingAttachment) -> c.int ---
	clipping_attachment_reference :: proc(self: ClippingAttachment) ---
	clipping_attachment_dereference :: proc(self: ClippingAttachment) ---
	clipping_attachment_rtti :: proc() -> Rtti ---
	color_create :: proc() -> Color ---
	color_create2 :: proc(r: c.float, g: c.float, b: c.float, a: c.float) -> Color ---
	color_dispose :: proc(self: Color) ---
	color_set_1 :: proc(self: Color, _r: c.float, _g: c.float, _b: c.float, _a: c.float) -> Color ---
	color_set_2 :: proc(self: Color, _r: c.float, _g: c.float, _b: c.float) -> Color ---
	color_set_3 :: proc(self: Color, other: Color) -> Color ---
	color_add_1 :: proc(self: Color, _r: c.float, _g: c.float, _b: c.float, _a: c.float) -> Color ---
	color_add_2 :: proc(self: Color, _r: c.float, _g: c.float, _b: c.float) -> Color ---
	color_add_3 :: proc(self: Color, other: Color) -> Color ---
	color_clamp :: proc(self: Color) -> Color ---
	color_parse_hex :: proc(value: cstring, index: c.size_t) -> c.float ---
	color_rgba8888_to_color :: proc(color: Color, value: c.int) ---
	color_rgb888_to_color :: proc(color: Color, value: c.int) ---
	color_get_r :: proc(self: Color) -> c.float ---
	color_set_r :: proc(self: Color, value: c.float) ---
	color_get_g :: proc(self: Color) -> c.float ---
	color_set_g :: proc(self: Color, value: c.float) ---
	color_get_b :: proc(self: Color) -> c.float ---
	color_set_b :: proc(self: Color, value: c.float) ---
	color_get_a :: proc(self: Color) -> c.float ---
	color_set_a :: proc(self: Color, value: c.float) ---
	constraint_dispose :: proc(self: Constraint) ---
	constraint_get_rtti :: proc(self: Constraint) -> Rtti ---
	constraint_get_data :: proc(self: Constraint) -> ConstraintData ---
	constraint_sort :: proc(self: Constraint, skeleton: Skeleton) ---
	constraint_is_source_active :: proc(self: Constraint) -> c.bool ---
	constraint_update :: proc(self: Constraint, skeleton: Skeleton, physics: Physics) ---
	constraint_rtti :: proc() -> Rtti ---
	constraint_data_dispose :: proc(self: ConstraintData) ---
	constraint_data_get_rtti :: proc(self: ConstraintData) -> Rtti ---
	constraint_data_create_method :: proc(self: ConstraintData, skeleton: Skeleton) -> Constraint ---
	constraint_data_get_name :: proc(self: ConstraintData) -> cstring ---
	constraint_data_get_skin_required :: proc(self: ConstraintData) -> c.bool ---
	constraint_data_rtti :: proc() -> Rtti ---
	constraint_timeline_dispose :: proc(self: ConstraintTimeline) ---
	constraint_timeline_get_rtti :: proc(self: ConstraintTimeline) -> Rtti ---
	constraint_timeline_get_constraint_index :: proc(self: ConstraintTimeline) -> c.int ---
	constraint_timeline_set_constraint_index :: proc(self: ConstraintTimeline, in_value: c.int) ---
	constraint_timeline_rtti :: proc() -> Rtti ---
	constraint_timeline1_dispose :: proc(self: ConstraintTimeline1) ---
	constraint_timeline1_get_rtti :: proc(self: ConstraintTimeline1) -> Rtti ---
	constraint_timeline1_get_constraint_index :: proc(self: ConstraintTimeline1) -> c.int ---
	constraint_timeline1_set_constraint_index :: proc(self: ConstraintTimeline1, in_value: c.int) ---
	constraint_timeline1_set_frame :: proc(self: ConstraintTimeline1, frame: c.size_t, time: c.float, value: c.float) ---
	constraint_timeline1_get_curve_value :: proc(self: ConstraintTimeline1, time: c.float) -> c.float ---
	constraint_timeline1_get_relative_value :: proc(self: ConstraintTimeline1, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	constraint_timeline1_get_absolute_value_1 :: proc(self: ConstraintTimeline1, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	constraint_timeline1_get_absolute_value_2 :: proc(self: ConstraintTimeline1, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float, value: c.float) -> c.float ---
	constraint_timeline1_get_scale_value :: proc(self: ConstraintTimeline1, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, current: c.float, setup: c.float) -> c.float ---
	constraint_timeline1_set_linear :: proc(self: ConstraintTimeline1, frame: c.size_t) ---
	constraint_timeline1_set_stepped :: proc(self: ConstraintTimeline1, frame: c.size_t) ---
	constraint_timeline1_set_bezier :: proc(self: ConstraintTimeline1, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	constraint_timeline1_get_bezier_value :: proc(self: ConstraintTimeline1, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	constraint_timeline1_get_curves :: proc(self: ConstraintTimeline1) -> ArrayFloat ---
	constraint_timeline1_apply :: proc(self: ConstraintTimeline1, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	constraint_timeline1_get_additive :: proc(self: ConstraintTimeline1) -> c.bool ---
	constraint_timeline1_get_instant :: proc(self: ConstraintTimeline1) -> c.bool ---
	constraint_timeline1_get_frame_entries :: proc(self: ConstraintTimeline1) -> c.size_t ---
	constraint_timeline1_get_frame_count :: proc(self: ConstraintTimeline1) -> c.size_t ---
	constraint_timeline1_get_frames :: proc(self: ConstraintTimeline1) -> ArrayFloat ---
	constraint_timeline1_get_duration :: proc(self: ConstraintTimeline1) -> c.float ---
	constraint_timeline1_get_property_ids :: proc(self: ConstraintTimeline1) -> ArrayPropertyId ---
	constraint_timeline1_rtti :: proc() -> Rtti ---
	curve_timeline_dispose :: proc(self: CurveTimeline) ---
	curve_timeline_get_rtti :: proc(self: CurveTimeline) -> Rtti ---
	curve_timeline_set_linear :: proc(self: CurveTimeline, frame: c.size_t) ---
	curve_timeline_set_stepped :: proc(self: CurveTimeline, frame: c.size_t) ---
	curve_timeline_set_bezier :: proc(self: CurveTimeline, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	curve_timeline_get_bezier_value :: proc(self: CurveTimeline, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	curve_timeline_get_curves :: proc(self: CurveTimeline) -> ArrayFloat ---
	curve_timeline_apply :: proc(self: CurveTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	curve_timeline_get_additive :: proc(self: CurveTimeline) -> c.bool ---
	curve_timeline_get_instant :: proc(self: CurveTimeline) -> c.bool ---
	curve_timeline_get_frame_entries :: proc(self: CurveTimeline) -> c.size_t ---
	curve_timeline_get_frame_count :: proc(self: CurveTimeline) -> c.size_t ---
	curve_timeline_get_frames :: proc(self: CurveTimeline) -> ArrayFloat ---
	curve_timeline_get_duration :: proc(self: CurveTimeline) -> c.float ---
	curve_timeline_get_property_ids :: proc(self: CurveTimeline) -> ArrayPropertyId ---
	curve_timeline_rtti :: proc() -> Rtti ---
	curve_timeline1_dispose :: proc(self: CurveTimeline1) ---
	curve_timeline1_get_rtti :: proc(self: CurveTimeline1) -> Rtti ---
	curve_timeline1_set_frame :: proc(self: CurveTimeline1, frame: c.size_t, time: c.float, value: c.float) ---
	curve_timeline1_get_curve_value :: proc(self: CurveTimeline1, time: c.float) -> c.float ---
	curve_timeline1_get_relative_value :: proc(self: CurveTimeline1, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	curve_timeline1_get_absolute_value_1 :: proc(self: CurveTimeline1, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	curve_timeline1_get_absolute_value_2 :: proc(self: CurveTimeline1, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float, value: c.float) -> c.float ---
	curve_timeline1_get_scale_value :: proc(self: CurveTimeline1, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, current: c.float, setup: c.float) -> c.float ---
	curve_timeline1_set_linear :: proc(self: CurveTimeline1, frame: c.size_t) ---
	curve_timeline1_set_stepped :: proc(self: CurveTimeline1, frame: c.size_t) ---
	curve_timeline1_set_bezier :: proc(self: CurveTimeline1, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	curve_timeline1_get_bezier_value :: proc(self: CurveTimeline1, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	curve_timeline1_get_curves :: proc(self: CurveTimeline1) -> ArrayFloat ---
	curve_timeline1_apply :: proc(self: CurveTimeline1, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	curve_timeline1_get_additive :: proc(self: CurveTimeline1) -> c.bool ---
	curve_timeline1_get_instant :: proc(self: CurveTimeline1) -> c.bool ---
	curve_timeline1_get_frame_entries :: proc(self: CurveTimeline1) -> c.size_t ---
	curve_timeline1_get_frame_count :: proc(self: CurveTimeline1) -> c.size_t ---
	curve_timeline1_get_frames :: proc(self: CurveTimeline1) -> ArrayFloat ---
	curve_timeline1_get_duration :: proc(self: CurveTimeline1) -> c.float ---
	curve_timeline1_get_property_ids :: proc(self: CurveTimeline1) -> ArrayPropertyId ---
	curve_timeline1_rtti :: proc() -> Rtti ---
	deform_timeline_create :: proc(frame_count: c.size_t, bezier_count: c.size_t, slot_index: c.int, attachment: VertexAttachment) -> DeformTimeline ---
	deform_timeline_dispose :: proc(self: DeformTimeline) ---
	deform_timeline_get_rtti :: proc(self: DeformTimeline) -> Rtti ---
	deform_timeline_apply :: proc(self: DeformTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	deform_timeline_set_frame :: proc(self: DeformTimeline, frame_index: c.int, time: c.float, vertices: ArrayFloat) ---
	deform_timeline_get_attachment :: proc(self: DeformTimeline) -> VertexAttachment ---
	deform_timeline_set_attachment :: proc(self: DeformTimeline, in_value: VertexAttachment) ---
	deform_timeline_set_bezier :: proc(self: DeformTimeline, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	deform_timeline_get_curve_percent :: proc(self: DeformTimeline, time: c.float, frame: c.int) -> c.float ---
	deform_timeline_get_frame_count :: proc(self: DeformTimeline) -> c.size_t ---
	deform_timeline_get_slot_index :: proc(self: DeformTimeline) -> c.int ---
	deform_timeline_set_slot_index :: proc(self: DeformTimeline, in_value: c.int) ---
	deform_timeline_set_linear :: proc(self: DeformTimeline, frame: c.size_t) ---
	deform_timeline_set_stepped :: proc(self: DeformTimeline, frame: c.size_t) ---
	deform_timeline_get_bezier_value :: proc(self: DeformTimeline, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	deform_timeline_get_curves :: proc(self: DeformTimeline) -> ArrayFloat ---
	deform_timeline_get_additive :: proc(self: DeformTimeline) -> c.bool ---
	deform_timeline_get_instant :: proc(self: DeformTimeline) -> c.bool ---
	deform_timeline_get_frame_entries :: proc(self: DeformTimeline) -> c.size_t ---
	deform_timeline_get_frames :: proc(self: DeformTimeline) -> ArrayFloat ---
	deform_timeline_get_duration :: proc(self: DeformTimeline) -> c.float ---
	deform_timeline_get_property_ids :: proc(self: DeformTimeline) -> ArrayPropertyId ---
	deform_timeline_rtti :: proc() -> Rtti ---
	draw_order_create :: proc(setup_pose: ArraySlot) -> DrawOrder ---
	draw_order_dispose :: proc(self: DrawOrder) ---
	draw_order_setup_pose :: proc(self: DrawOrder) ---
	draw_order_get_pose :: proc(self: DrawOrder) -> ArraySlot ---
	draw_order_get_applied_pose :: proc(self: DrawOrder) -> ArraySlot ---
	draw_order_folder_timeline_create :: proc(frame_count: c.size_t, slots: ArrayInt, slot_count: c.size_t) -> DrawOrderFolderTimeline ---
	draw_order_folder_timeline_dispose :: proc(self: DrawOrderFolderTimeline) ---
	draw_order_folder_timeline_get_rtti :: proc(self: DrawOrderFolderTimeline) -> Rtti ---
	draw_order_folder_timeline_apply :: proc(self: DrawOrderFolderTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	draw_order_folder_timeline_get_frame_count :: proc(self: DrawOrderFolderTimeline) -> c.size_t ---
	draw_order_folder_timeline_get_slots :: proc(self: DrawOrderFolderTimeline) -> ArrayInt ---
	draw_order_folder_timeline_set_frame :: proc(self: DrawOrderFolderTimeline, frame: c.size_t, time: c.float, draw_order: ArrayInt) ---
	draw_order_folder_timeline_get_additive :: proc(self: DrawOrderFolderTimeline) -> c.bool ---
	draw_order_folder_timeline_get_instant :: proc(self: DrawOrderFolderTimeline) -> c.bool ---
	draw_order_folder_timeline_get_frame_entries :: proc(self: DrawOrderFolderTimeline) -> c.size_t ---
	draw_order_folder_timeline_get_frames :: proc(self: DrawOrderFolderTimeline) -> ArrayFloat ---
	draw_order_folder_timeline_get_duration :: proc(self: DrawOrderFolderTimeline) -> c.float ---
	draw_order_folder_timeline_get_property_ids :: proc(self: DrawOrderFolderTimeline) -> ArrayPropertyId ---
	draw_order_folder_timeline_rtti :: proc() -> Rtti ---
	draw_order_timeline_create :: proc(frame_count: c.size_t) -> DrawOrderTimeline ---
	draw_order_timeline_dispose :: proc(self: DrawOrderTimeline) ---
	draw_order_timeline_get_rtti :: proc(self: DrawOrderTimeline) -> Rtti ---
	draw_order_timeline_apply :: proc(self: DrawOrderTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	draw_order_timeline_get_frame_count :: proc(self: DrawOrderTimeline) -> c.size_t ---
	draw_order_timeline_set_frame :: proc(self: DrawOrderTimeline, frame: c.size_t, time: c.float, draw_order: ArrayInt) ---
	draw_order_timeline_get_additive :: proc(self: DrawOrderTimeline) -> c.bool ---
	draw_order_timeline_get_instant :: proc(self: DrawOrderTimeline) -> c.bool ---
	draw_order_timeline_get_frame_entries :: proc(self: DrawOrderTimeline) -> c.size_t ---
	draw_order_timeline_get_frames :: proc(self: DrawOrderTimeline) -> ArrayFloat ---
	draw_order_timeline_get_duration :: proc(self: DrawOrderTimeline) -> c.float ---
	draw_order_timeline_get_property_ids :: proc(self: DrawOrderTimeline) -> ArrayPropertyId ---
	draw_order_timeline_rtti :: proc() -> Rtti ---
	event_create :: proc(time: c.float, data: EventData) -> Event ---
	event_dispose :: proc(self: Event) ---
	event_get_data :: proc(self: Event) -> EventData ---
	event_get_time :: proc(self: Event) -> c.float ---
	event_get_int :: proc(self: Event) -> c.int ---
	event_set_int :: proc(self: Event, in_value: c.int) ---
	event_get_float :: proc(self: Event) -> c.float ---
	event_set_float :: proc(self: Event, in_value: c.float) ---
	event_get_string :: proc(self: Event) -> cstring ---
	event_set_string :: proc(self: Event, in_value: cstring) ---
	event_get_volume :: proc(self: Event) -> c.float ---
	event_set_volume :: proc(self: Event, in_value: c.float) ---
	event_get_balance :: proc(self: Event) -> c.float ---
	event_set_balance :: proc(self: Event, in_value: c.float) ---
	event_data_create :: proc(name: cstring) -> EventData ---
	event_data_dispose :: proc(self: EventData) ---
	event_data_get_name :: proc(self: EventData) -> cstring ---
	event_data_get_setup_pose_1 :: proc(self: EventData) -> Event ---
	event_data_get_setup_pose_2 :: proc(self: EventData) -> Event ---
	event_data_get_audio_path :: proc(self: EventData) -> cstring ---
	event_data_set_audio_path :: proc(self: EventData, in_value: cstring) ---
	event_queue_entry_create :: proc(event_type: EventType, track_entry: TrackEntry, event: Event) -> EventQueueEntry ---
	event_queue_entry_dispose :: proc(self: EventQueueEntry) ---
	event_queue_entry_get__type :: proc(self: EventQueueEntry) -> EventType ---
	event_queue_entry_set__type :: proc(self: EventQueueEntry, value: EventType) ---
	event_queue_entry_get__entry :: proc(self: EventQueueEntry) -> TrackEntry ---
	event_queue_entry_set__entry :: proc(self: EventQueueEntry, value: TrackEntry) ---
	event_queue_entry_get__event :: proc(self: EventQueueEntry) -> Event ---
	event_queue_entry_set__event :: proc(self: EventQueueEntry, value: Event) ---
	event_timeline_create :: proc(frame_count: c.size_t) -> EventTimeline ---
	event_timeline_dispose :: proc(self: EventTimeline) ---
	event_timeline_get_rtti :: proc(self: EventTimeline) -> Rtti ---
	event_timeline_apply :: proc(self: EventTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	event_timeline_get_frame_count :: proc(self: EventTimeline) -> c.size_t ---
	event_timeline_get_events :: proc(self: EventTimeline) -> ArrayEvent ---
	event_timeline_set_frame :: proc(self: EventTimeline, frame: c.size_t, event: Event) ---
	event_timeline_get_additive :: proc(self: EventTimeline) -> c.bool ---
	event_timeline_get_instant :: proc(self: EventTimeline) -> c.bool ---
	event_timeline_get_frame_entries :: proc(self: EventTimeline) -> c.size_t ---
	event_timeline_get_frames :: proc(self: EventTimeline) -> ArrayFloat ---
	event_timeline_get_duration :: proc(self: EventTimeline) -> c.float ---
	event_timeline_get_property_ids :: proc(self: EventTimeline) -> ArrayPropertyId ---
	event_timeline_rtti :: proc() -> Rtti ---
	from_property_dispose :: proc(self: FromProperty) ---
	from_property_get_rtti :: proc(self: FromProperty) -> Rtti ---
	from_property_value :: proc(self: FromProperty, skeleton: Skeleton, source: BonePose, local: c.bool, offsets: [^]c.float) -> c.float ---
	from_property_rtti :: proc() -> Rtti ---
	from_property_get__offset :: proc(self: FromProperty) -> c.float ---
	from_property_set__offset :: proc(self: FromProperty, value: c.float) ---
	from_property_get__to :: proc(self: FromProperty) -> ArrayToProperty ---
	from_property_set__to :: proc(self: FromProperty, value: ArrayToProperty) ---
	from_rotate_create :: proc() -> FromRotate ---
	from_rotate_dispose :: proc(self: FromRotate) ---
	from_rotate_get_rtti :: proc(self: FromRotate) -> Rtti ---
	from_rotate_value :: proc(self: FromRotate, skeleton: Skeleton, source: BonePose, local: c.bool, offsets: [^]c.float) -> c.float ---
	from_rotate_rtti :: proc() -> Rtti ---
	from_scale_x_create :: proc() -> FromScaleX ---
	from_scale_x_dispose :: proc(self: FromScaleX) ---
	from_scale_x_get_rtti :: proc(self: FromScaleX) -> Rtti ---
	from_scale_x_value :: proc(self: FromScaleX, skeleton: Skeleton, source: BonePose, local: c.bool, offsets: [^]c.float) -> c.float ---
	from_scale_x_rtti :: proc() -> Rtti ---
	from_scale_y_create :: proc() -> FromScaleY ---
	from_scale_y_dispose :: proc(self: FromScaleY) ---
	from_scale_y_get_rtti :: proc(self: FromScaleY) -> Rtti ---
	from_scale_y_value :: proc(self: FromScaleY, skeleton: Skeleton, source: BonePose, local: c.bool, offsets: [^]c.float) -> c.float ---
	from_scale_y_rtti :: proc() -> Rtti ---
	from_shear_y_create :: proc() -> FromShearY ---
	from_shear_y_dispose :: proc(self: FromShearY) ---
	from_shear_y_get_rtti :: proc(self: FromShearY) -> Rtti ---
	from_shear_y_value :: proc(self: FromShearY, skeleton: Skeleton, source: BonePose, local: c.bool, offsets: [^]c.float) -> c.float ---
	from_shear_y_rtti :: proc() -> Rtti ---
	from_x_create :: proc() -> FromX ---
	from_x_dispose :: proc(self: FromX) ---
	from_x_get_rtti :: proc(self: FromX) -> Rtti ---
	from_x_value :: proc(self: FromX, skeleton: Skeleton, source: BonePose, local: c.bool, offsets: [^]c.float) -> c.float ---
	from_x_rtti :: proc() -> Rtti ---
	from_y_create :: proc() -> FromY ---
	from_y_dispose :: proc(self: FromY) ---
	from_y_get_rtti :: proc(self: FromY) -> Rtti ---
	from_y_value :: proc(self: FromY, skeleton: Skeleton, source: BonePose, local: c.bool, offsets: [^]c.float) -> c.float ---
	from_y_rtti :: proc() -> Rtti ---
	ik_constraint_create :: proc(data: IkConstraintData, skeleton: Skeleton) -> IkConstraint ---
	ik_constraint_dispose :: proc(self: IkConstraint) ---
	ik_constraint_get_rtti :: proc(self: IkConstraint) -> Rtti ---
	ik_constraint_copy :: proc(self: IkConstraint, skeleton: Skeleton) -> IkConstraint ---
	ik_constraint_update :: proc(self: IkConstraint, skeleton: Skeleton, physics: Physics) ---
	ik_constraint_sort :: proc(self: IkConstraint, skeleton: Skeleton) ---
	ik_constraint_is_source_active :: proc(self: IkConstraint) -> c.bool ---
	ik_constraint_get_bones :: proc(self: IkConstraint) -> ArrayBonePose ---
	ik_constraint_get_target :: proc(self: IkConstraint) -> Bone ---
	ik_constraint_set_target :: proc(self: IkConstraint, in_value: Bone) ---
	ik_constraint_apply_1 :: proc(skeleton: Skeleton, bone: BonePose, target_x: c.float, target_y: c.float, compress: c.bool, stretch: c.bool, uniform: c.bool, mix: c.float) ---
	ik_constraint_apply_2 :: proc(skeleton: Skeleton, parent: BonePose, child: BonePose, target_x: c.float, target_y: c.float, bend_direction: c.int, stretch: c.bool, uniform: c.bool, softness: c.float, mix: c.float) ---
	ik_constraint_get_data :: proc(self: IkConstraint) -> IkConstraintData ---
	ik_constraint_get_pose :: proc(self: IkConstraint) -> IkConstraintPose ---
	ik_constraint_get_applied_pose :: proc(self: IkConstraint) -> IkConstraintPose ---
	ik_constraint_reset_constrained :: proc(self: IkConstraint) ---
	ik_constraint_constrained :: proc(self: IkConstraint) ---
	ik_constraint_is_pose_equal_to_applied :: proc(self: IkConstraint) -> c.bool ---
	ik_constraint_is_active :: proc(self: IkConstraint) -> c.bool ---
	ik_constraint_set_active :: proc(self: IkConstraint, active: c.bool) ---
	ik_constraint_rtti :: proc() -> Rtti ---
	ik_constraint_base_dispose :: proc(self: IkConstraintBase) ---
	ik_constraint_base_get_data :: proc(self: IkConstraintBase) -> IkConstraintData ---
	ik_constraint_base_get_pose :: proc(self: IkConstraintBase) -> IkConstraintPose ---
	ik_constraint_base_get_applied_pose :: proc(self: IkConstraintBase) -> IkConstraintPose ---
	ik_constraint_base_reset_constrained :: proc(self: IkConstraintBase) ---
	ik_constraint_base_constrained :: proc(self: IkConstraintBase) ---
	ik_constraint_base_is_pose_equal_to_applied :: proc(self: IkConstraintBase) -> c.bool ---
	ik_constraint_base_is_active :: proc(self: IkConstraintBase) -> c.bool ---
	ik_constraint_base_set_active :: proc(self: IkConstraintBase, active: c.bool) ---
	ik_constraint_base_get_rtti :: proc(self: IkConstraintBase) -> Rtti ---
	ik_constraint_base_sort :: proc(self: IkConstraintBase, skeleton: Skeleton) ---
	ik_constraint_base_is_source_active :: proc(self: IkConstraintBase) -> c.bool ---
	ik_constraint_base_update :: proc(self: IkConstraintBase, skeleton: Skeleton, physics: Physics) ---
	ik_constraint_base_rtti :: proc() -> Rtti ---
	ik_constraint_data_create :: proc(name: cstring) -> IkConstraintData ---
	ik_constraint_data_dispose :: proc(self: IkConstraintData) ---
	ik_constraint_data_get_rtti :: proc(self: IkConstraintData) -> Rtti ---
	ik_constraint_data_create_method :: proc(self: IkConstraintData, skeleton: Skeleton) -> Constraint ---
	ik_constraint_data_get_bones :: proc(self: IkConstraintData) -> ArrayBoneData ---
	ik_constraint_data_get_target :: proc(self: IkConstraintData) -> BoneData ---
	ik_constraint_data_set_target :: proc(self: IkConstraintData, in_value: BoneData) ---
	ik_constraint_data_get_uniform :: proc(self: IkConstraintData) -> c.bool ---
	ik_constraint_data_set_uniform :: proc(self: IkConstraintData, uniform: c.bool) ---
	ik_constraint_data_get_name :: proc(self: IkConstraintData) -> cstring ---
	ik_constraint_data_get_skin_required :: proc(self: IkConstraintData) -> c.bool ---
	ik_constraint_data_get_setup_pose :: proc(self: IkConstraintData) -> IkConstraintPose ---
	ik_constraint_data_set_skin_required :: proc(self: IkConstraintData, skin_required: c.bool) ---
	ik_constraint_data_rtti :: proc() -> Rtti ---
	ik_constraint_pose_create :: proc() -> IkConstraintPose ---
	ik_constraint_pose_dispose :: proc(self: IkConstraintPose) ---
	ik_constraint_pose_set :: proc(self: IkConstraintPose, pose: IkConstraintPose) ---
	ik_constraint_pose_get_mix :: proc(self: IkConstraintPose) -> c.float ---
	ik_constraint_pose_set_mix :: proc(self: IkConstraintPose, mix: c.float) ---
	ik_constraint_pose_get_softness :: proc(self: IkConstraintPose) -> c.float ---
	ik_constraint_pose_set_softness :: proc(self: IkConstraintPose, softness: c.float) ---
	ik_constraint_pose_get_bend_direction :: proc(self: IkConstraintPose) -> c.int ---
	ik_constraint_pose_set_bend_direction :: proc(self: IkConstraintPose, bend_direction: c.int) ---
	ik_constraint_pose_get_compress :: proc(self: IkConstraintPose) -> c.bool ---
	ik_constraint_pose_set_compress :: proc(self: IkConstraintPose, compress: c.bool) ---
	ik_constraint_pose_get_stretch :: proc(self: IkConstraintPose) -> c.bool ---
	ik_constraint_pose_set_stretch :: proc(self: IkConstraintPose, stretch: c.bool) ---
	ik_constraint_timeline_create :: proc(frame_count: c.size_t, bezier_count: c.size_t, constraint_index: c.int) -> IkConstraintTimeline ---
	ik_constraint_timeline_dispose :: proc(self: IkConstraintTimeline) ---
	ik_constraint_timeline_get_rtti :: proc(self: IkConstraintTimeline) -> Rtti ---
	ik_constraint_timeline_apply :: proc(self: IkConstraintTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	ik_constraint_timeline_set_frame :: proc(self: IkConstraintTimeline, frame: c.int, time: c.float, mix: c.float, softness: c.float, bend_direction: c.int, compress: c.bool, stretch: c.bool) ---
	ik_constraint_timeline_get_constraint_index :: proc(self: IkConstraintTimeline) -> c.int ---
	ik_constraint_timeline_set_constraint_index :: proc(self: IkConstraintTimeline, in_value: c.int) ---
	ik_constraint_timeline_set_linear :: proc(self: IkConstraintTimeline, frame: c.size_t) ---
	ik_constraint_timeline_set_stepped :: proc(self: IkConstraintTimeline, frame: c.size_t) ---
	ik_constraint_timeline_set_bezier :: proc(self: IkConstraintTimeline, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	ik_constraint_timeline_get_bezier_value :: proc(self: IkConstraintTimeline, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	ik_constraint_timeline_get_curves :: proc(self: IkConstraintTimeline) -> ArrayFloat ---
	ik_constraint_timeline_get_additive :: proc(self: IkConstraintTimeline) -> c.bool ---
	ik_constraint_timeline_get_instant :: proc(self: IkConstraintTimeline) -> c.bool ---
	ik_constraint_timeline_get_frame_entries :: proc(self: IkConstraintTimeline) -> c.size_t ---
	ik_constraint_timeline_get_frame_count :: proc(self: IkConstraintTimeline) -> c.size_t ---
	ik_constraint_timeline_get_frames :: proc(self: IkConstraintTimeline) -> ArrayFloat ---
	ik_constraint_timeline_get_duration :: proc(self: IkConstraintTimeline) -> c.float ---
	ik_constraint_timeline_get_property_ids :: proc(self: IkConstraintTimeline) -> ArrayPropertyId ---
	ik_constraint_timeline_rtti :: proc() -> Rtti ---
	inherit_timeline_create :: proc(frame_count: c.size_t, bone_index: c.int) -> InheritTimeline ---
	inherit_timeline_dispose :: proc(self: InheritTimeline) ---
	inherit_timeline_get_rtti :: proc(self: InheritTimeline) -> Rtti ---
	inherit_timeline_set_frame :: proc(self: InheritTimeline, frame: c.int, time: c.float, inherit: Inherit) ---
	inherit_timeline_apply :: proc(self: InheritTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	inherit_timeline_get_bone_index :: proc(self: InheritTimeline) -> c.int ---
	inherit_timeline_set_bone_index :: proc(self: InheritTimeline, in_value: c.int) ---
	inherit_timeline_get_additive :: proc(self: InheritTimeline) -> c.bool ---
	inherit_timeline_get_instant :: proc(self: InheritTimeline) -> c.bool ---
	inherit_timeline_get_frame_entries :: proc(self: InheritTimeline) -> c.size_t ---
	inherit_timeline_get_frame_count :: proc(self: InheritTimeline) -> c.size_t ---
	inherit_timeline_get_frames :: proc(self: InheritTimeline) -> ArrayFloat ---
	inherit_timeline_get_duration :: proc(self: InheritTimeline) -> c.float ---
	inherit_timeline_get_property_ids :: proc(self: InheritTimeline) -> ArrayPropertyId ---
	inherit_timeline_rtti :: proc() -> Rtti ---
	linked_mesh_create :: proc(mesh: MeshAttachment, skin_index: c.int, slot_index: c.size_t, source_index: c.size_t, source: cstring, inherit_timelines: c.bool) -> LinkedMesh ---
	linked_mesh_create2 :: proc(mesh: MeshAttachment, skin: cstring, slot_index: c.size_t, source_index: c.size_t, source: cstring, inherit_timelines: c.bool) -> LinkedMesh ---
	linked_mesh_dispose :: proc(self: LinkedMesh) ---
	mesh_attachment_create :: proc(name: cstring, sequence: Sequence) -> MeshAttachment ---
	mesh_attachment_dispose :: proc(self: MeshAttachment) ---
	mesh_attachment_get_rtti :: proc(self: MeshAttachment) -> Rtti ---
	mesh_attachment_compute_world_vertices_1 :: proc(self: MeshAttachment, skeleton: Skeleton, slot: Slot, start: c.size_t, count: c.size_t, world_vertices: [^]c.float, offset: c.size_t, stride: c.size_t) ---
	mesh_attachment_compute_world_vertices_2 :: proc(self: MeshAttachment, skeleton: Skeleton, slot: Slot, start: c.size_t, count: c.size_t, world_vertices: ArrayFloat, offset: c.size_t, stride: c.size_t) ---
	mesh_attachment_get_region_u_vs :: proc(self: MeshAttachment) -> ArrayFloat ---
	mesh_attachment_set_region_u_vs :: proc(self: MeshAttachment, in_value: ArrayFloat) ---
	mesh_attachment_get_triangles :: proc(self: MeshAttachment) -> ArrayUnsignedShort ---
	mesh_attachment_set_triangles :: proc(self: MeshAttachment, in_value: ArrayUnsignedShort) ---
	mesh_attachment_get_hull_length :: proc(self: MeshAttachment) -> c.int ---
	mesh_attachment_set_hull_length :: proc(self: MeshAttachment, in_value: c.int) ---
	mesh_attachment_get_sequence :: proc(self: MeshAttachment) -> Sequence ---
	mesh_attachment_update_sequence :: proc(self: MeshAttachment) ---
	mesh_attachment_get_path :: proc(self: MeshAttachment) -> cstring ---
	mesh_attachment_set_path :: proc(self: MeshAttachment, in_value: cstring) ---
	mesh_attachment_get_color :: proc(self: MeshAttachment) -> Color ---
	mesh_attachment_get_source_mesh :: proc(self: MeshAttachment) -> MeshAttachment ---
	mesh_attachment_set_source_mesh :: proc(self: MeshAttachment, in_value: MeshAttachment) ---
	mesh_attachment_get_edges :: proc(self: MeshAttachment) -> ArrayUnsignedShort ---
	mesh_attachment_set_edges :: proc(self: MeshAttachment, in_value: ArrayUnsignedShort) ---
	mesh_attachment_get_width :: proc(self: MeshAttachment) -> c.float ---
	mesh_attachment_set_width :: proc(self: MeshAttachment, in_value: c.float) ---
	mesh_attachment_get_height :: proc(self: MeshAttachment) -> c.float ---
	mesh_attachment_set_height :: proc(self: MeshAttachment, in_value: c.float) ---
	mesh_attachment_copy :: proc(self: MeshAttachment) -> Attachment ---
	mesh_attachment_new_linked_mesh :: proc(self: MeshAttachment) -> MeshAttachment ---
	mesh_attachment_compute_u_vs :: proc(region: TextureRegion, region_u_vs: ArrayFloat, uvs: ArrayFloat) ---
	mesh_attachment_get_id :: proc(self: MeshAttachment) -> c.int ---
	mesh_attachment_get_bones :: proc(self: MeshAttachment) -> ArrayInt ---
	mesh_attachment_set_bones :: proc(self: MeshAttachment, bones: ArrayInt) ---
	mesh_attachment_get_vertices :: proc(self: MeshAttachment) -> ArrayFloat ---
	mesh_attachment_set_vertices :: proc(self: MeshAttachment, vertices: ArrayFloat) ---
	mesh_attachment_get_world_vertices_length :: proc(self: MeshAttachment) -> c.size_t ---
	mesh_attachment_set_world_vertices_length :: proc(self: MeshAttachment, in_value: c.size_t) ---
	mesh_attachment_get_timeline_attachment :: proc(self: MeshAttachment) -> Attachment ---
	mesh_attachment_set_timeline_attachment :: proc(self: MeshAttachment, attachment: Attachment) ---
	mesh_attachment_copy_to :: proc(self: MeshAttachment, other: VertexAttachment) ---
	mesh_attachment_get_name :: proc(self: MeshAttachment) -> cstring ---
	mesh_attachment_get_timeline_slots :: proc(self: MeshAttachment) -> ArrayInt ---
	mesh_attachment_set_timeline_slots :: proc(self: MeshAttachment, timeline_slots: ArrayInt) ---
	mesh_attachment_is_timeline_active :: proc(self: MeshAttachment, slots: ArraySlot, slot_index: c.int, applied_pose: c.bool) -> c.bool ---
	mesh_attachment_get_ref_count :: proc(self: MeshAttachment) -> c.int ---
	mesh_attachment_reference :: proc(self: MeshAttachment) ---
	mesh_attachment_dereference :: proc(self: MeshAttachment) ---
	mesh_attachment_rtti :: proc() -> Rtti ---
	path_attachment_create :: proc(name: cstring) -> PathAttachment ---
	path_attachment_dispose :: proc(self: PathAttachment) ---
	path_attachment_get_rtti :: proc(self: PathAttachment) -> Rtti ---
	path_attachment_get_lengths :: proc(self: PathAttachment) -> ArrayFloat ---
	path_attachment_set_lengths :: proc(self: PathAttachment, in_value: ArrayFloat) ---
	path_attachment_get_closed :: proc(self: PathAttachment) -> c.bool ---
	path_attachment_set_closed :: proc(self: PathAttachment, in_value: c.bool) ---
	path_attachment_get_constant_speed :: proc(self: PathAttachment) -> c.bool ---
	path_attachment_set_constant_speed :: proc(self: PathAttachment, in_value: c.bool) ---
	path_attachment_get_color :: proc(self: PathAttachment) -> Color ---
	path_attachment_copy :: proc(self: PathAttachment) -> Attachment ---
	path_attachment_compute_world_vertices_1 :: proc(self: PathAttachment, skeleton: Skeleton, slot: Slot, start: c.size_t, count: c.size_t, world_vertices: [^]c.float, offset: c.size_t, stride: c.size_t) ---
	path_attachment_compute_world_vertices_2 :: proc(self: PathAttachment, skeleton: Skeleton, slot: Slot, start: c.size_t, count: c.size_t, world_vertices: ArrayFloat, offset: c.size_t, stride: c.size_t) ---
	path_attachment_get_id :: proc(self: PathAttachment) -> c.int ---
	path_attachment_get_bones :: proc(self: PathAttachment) -> ArrayInt ---
	path_attachment_set_bones :: proc(self: PathAttachment, bones: ArrayInt) ---
	path_attachment_get_vertices :: proc(self: PathAttachment) -> ArrayFloat ---
	path_attachment_set_vertices :: proc(self: PathAttachment, vertices: ArrayFloat) ---
	path_attachment_get_world_vertices_length :: proc(self: PathAttachment) -> c.size_t ---
	path_attachment_set_world_vertices_length :: proc(self: PathAttachment, in_value: c.size_t) ---
	path_attachment_get_timeline_attachment :: proc(self: PathAttachment) -> Attachment ---
	path_attachment_set_timeline_attachment :: proc(self: PathAttachment, attachment: Attachment) ---
	path_attachment_copy_to :: proc(self: PathAttachment, other: VertexAttachment) ---
	path_attachment_get_name :: proc(self: PathAttachment) -> cstring ---
	path_attachment_get_timeline_slots :: proc(self: PathAttachment) -> ArrayInt ---
	path_attachment_set_timeline_slots :: proc(self: PathAttachment, timeline_slots: ArrayInt) ---
	path_attachment_is_timeline_active :: proc(self: PathAttachment, slots: ArraySlot, slot_index: c.int, applied_pose: c.bool) -> c.bool ---
	path_attachment_get_ref_count :: proc(self: PathAttachment) -> c.int ---
	path_attachment_reference :: proc(self: PathAttachment) ---
	path_attachment_dereference :: proc(self: PathAttachment) ---
	path_attachment_rtti :: proc() -> Rtti ---
	path_constraint_create :: proc(data: PathConstraintData, skeleton: Skeleton) -> PathConstraint ---
	path_constraint_dispose :: proc(self: PathConstraint) ---
	path_constraint_get_rtti :: proc(self: PathConstraint) -> Rtti ---
	path_constraint_copy :: proc(self: PathConstraint, skeleton: Skeleton) -> PathConstraint ---
	path_constraint_update :: proc(self: PathConstraint, skeleton: Skeleton, physics: Physics) ---
	path_constraint_sort :: proc(self: PathConstraint, skeleton: Skeleton) ---
	path_constraint_is_source_active :: proc(self: PathConstraint) -> c.bool ---
	path_constraint_get_bones :: proc(self: PathConstraint) -> ArrayBonePose ---
	path_constraint_get_slot :: proc(self: PathConstraint) -> Slot ---
	path_constraint_set_slot :: proc(self: PathConstraint, slot: Slot) ---
	path_constraint_get_data :: proc(self: PathConstraint) -> PathConstraintData ---
	path_constraint_get_pose :: proc(self: PathConstraint) -> PathConstraintPose ---
	path_constraint_get_applied_pose :: proc(self: PathConstraint) -> PathConstraintPose ---
	path_constraint_reset_constrained :: proc(self: PathConstraint) ---
	path_constraint_constrained :: proc(self: PathConstraint) ---
	path_constraint_is_pose_equal_to_applied :: proc(self: PathConstraint) -> c.bool ---
	path_constraint_is_active :: proc(self: PathConstraint) -> c.bool ---
	path_constraint_set_active :: proc(self: PathConstraint, active: c.bool) ---
	path_constraint_rtti :: proc() -> Rtti ---
	path_constraint_base_dispose :: proc(self: PathConstraintBase) ---
	path_constraint_base_get_data :: proc(self: PathConstraintBase) -> PathConstraintData ---
	path_constraint_base_get_pose :: proc(self: PathConstraintBase) -> PathConstraintPose ---
	path_constraint_base_get_applied_pose :: proc(self: PathConstraintBase) -> PathConstraintPose ---
	path_constraint_base_reset_constrained :: proc(self: PathConstraintBase) ---
	path_constraint_base_constrained :: proc(self: PathConstraintBase) ---
	path_constraint_base_is_pose_equal_to_applied :: proc(self: PathConstraintBase) -> c.bool ---
	path_constraint_base_is_active :: proc(self: PathConstraintBase) -> c.bool ---
	path_constraint_base_set_active :: proc(self: PathConstraintBase, active: c.bool) ---
	path_constraint_base_get_rtti :: proc(self: PathConstraintBase) -> Rtti ---
	path_constraint_base_sort :: proc(self: PathConstraintBase, skeleton: Skeleton) ---
	path_constraint_base_is_source_active :: proc(self: PathConstraintBase) -> c.bool ---
	path_constraint_base_update :: proc(self: PathConstraintBase, skeleton: Skeleton, physics: Physics) ---
	path_constraint_base_rtti :: proc() -> Rtti ---
	path_constraint_data_create :: proc(name: cstring) -> PathConstraintData ---
	path_constraint_data_dispose :: proc(self: PathConstraintData) ---
	path_constraint_data_get_rtti :: proc(self: PathConstraintData) -> Rtti ---
	path_constraint_data_create_method :: proc(self: PathConstraintData, skeleton: Skeleton) -> Constraint ---
	path_constraint_data_get_bones :: proc(self: PathConstraintData) -> ArrayBoneData ---
	path_constraint_data_get_slot :: proc(self: PathConstraintData) -> SlotData ---
	path_constraint_data_set_slot :: proc(self: PathConstraintData, slot: SlotData) ---
	path_constraint_data_get_position_mode :: proc(self: PathConstraintData) -> PositionMode ---
	path_constraint_data_set_position_mode :: proc(self: PathConstraintData, position_mode: PositionMode) ---
	path_constraint_data_get_spacing_mode :: proc(self: PathConstraintData) -> SpacingMode ---
	path_constraint_data_set_spacing_mode :: proc(self: PathConstraintData, spacing_mode: SpacingMode) ---
	path_constraint_data_get_rotate_mode :: proc(self: PathConstraintData) -> RotateMode ---
	path_constraint_data_set_rotate_mode :: proc(self: PathConstraintData, rotate_mode: RotateMode) ---
	path_constraint_data_get_offset_rotation :: proc(self: PathConstraintData) -> c.float ---
	path_constraint_data_set_offset_rotation :: proc(self: PathConstraintData, offset_rotation: c.float) ---
	path_constraint_data_get_name :: proc(self: PathConstraintData) -> cstring ---
	path_constraint_data_get_skin_required :: proc(self: PathConstraintData) -> c.bool ---
	path_constraint_data_get_setup_pose :: proc(self: PathConstraintData) -> PathConstraintPose ---
	path_constraint_data_set_skin_required :: proc(self: PathConstraintData, skin_required: c.bool) ---
	path_constraint_data_rtti :: proc() -> Rtti ---
	path_constraint_mix_timeline_create :: proc(frame_count: c.size_t, bezier_count: c.size_t, constraint_index: c.int) -> PathConstraintMixTimeline ---
	path_constraint_mix_timeline_dispose :: proc(self: PathConstraintMixTimeline) ---
	path_constraint_mix_timeline_get_rtti :: proc(self: PathConstraintMixTimeline) -> Rtti ---
	path_constraint_mix_timeline_apply :: proc(self: PathConstraintMixTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	path_constraint_mix_timeline_set_frame :: proc(self: PathConstraintMixTimeline, frame: c.int, time: c.float, mix_rotate: c.float, mix_x: c.float, mix_y: c.float) ---
	path_constraint_mix_timeline_get_constraint_index :: proc(self: PathConstraintMixTimeline) -> c.int ---
	path_constraint_mix_timeline_set_constraint_index :: proc(self: PathConstraintMixTimeline, in_value: c.int) ---
	path_constraint_mix_timeline_set_linear :: proc(self: PathConstraintMixTimeline, frame: c.size_t) ---
	path_constraint_mix_timeline_set_stepped :: proc(self: PathConstraintMixTimeline, frame: c.size_t) ---
	path_constraint_mix_timeline_set_bezier :: proc(self: PathConstraintMixTimeline, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	path_constraint_mix_timeline_get_bezier_value :: proc(self: PathConstraintMixTimeline, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	path_constraint_mix_timeline_get_curves :: proc(self: PathConstraintMixTimeline) -> ArrayFloat ---
	path_constraint_mix_timeline_get_additive :: proc(self: PathConstraintMixTimeline) -> c.bool ---
	path_constraint_mix_timeline_get_instant :: proc(self: PathConstraintMixTimeline) -> c.bool ---
	path_constraint_mix_timeline_get_frame_entries :: proc(self: PathConstraintMixTimeline) -> c.size_t ---
	path_constraint_mix_timeline_get_frame_count :: proc(self: PathConstraintMixTimeline) -> c.size_t ---
	path_constraint_mix_timeline_get_frames :: proc(self: PathConstraintMixTimeline) -> ArrayFloat ---
	path_constraint_mix_timeline_get_duration :: proc(self: PathConstraintMixTimeline) -> c.float ---
	path_constraint_mix_timeline_get_property_ids :: proc(self: PathConstraintMixTimeline) -> ArrayPropertyId ---
	path_constraint_mix_timeline_rtti :: proc() -> Rtti ---
	path_constraint_pose_create :: proc() -> PathConstraintPose ---
	path_constraint_pose_dispose :: proc(self: PathConstraintPose) ---
	path_constraint_pose_set :: proc(self: PathConstraintPose, pose: PathConstraintPose) ---
	path_constraint_pose_get_position :: proc(self: PathConstraintPose) -> c.float ---
	path_constraint_pose_set_position :: proc(self: PathConstraintPose, position: c.float) ---
	path_constraint_pose_get_spacing :: proc(self: PathConstraintPose) -> c.float ---
	path_constraint_pose_set_spacing :: proc(self: PathConstraintPose, spacing: c.float) ---
	path_constraint_pose_get_mix_rotate :: proc(self: PathConstraintPose) -> c.float ---
	path_constraint_pose_set_mix_rotate :: proc(self: PathConstraintPose, mix_rotate: c.float) ---
	path_constraint_pose_get_mix_x :: proc(self: PathConstraintPose) -> c.float ---
	path_constraint_pose_set_mix_x :: proc(self: PathConstraintPose, mix_x: c.float) ---
	path_constraint_pose_get_mix_y :: proc(self: PathConstraintPose) -> c.float ---
	path_constraint_pose_set_mix_y :: proc(self: PathConstraintPose, mix_y: c.float) ---
	path_constraint_position_timeline_create :: proc(frame_count: c.size_t, bezier_count: c.size_t, constraint_index: c.int) -> PathConstraintPositionTimeline ---
	path_constraint_position_timeline_dispose :: proc(self: PathConstraintPositionTimeline) ---
	path_constraint_position_timeline_get_rtti :: proc(self: PathConstraintPositionTimeline) -> Rtti ---
	path_constraint_position_timeline_apply :: proc(self: PathConstraintPositionTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	path_constraint_position_timeline_get_constraint_index :: proc(self: PathConstraintPositionTimeline) -> c.int ---
	path_constraint_position_timeline_set_constraint_index :: proc(self: PathConstraintPositionTimeline, in_value: c.int) ---
	path_constraint_position_timeline_set_frame :: proc(self: PathConstraintPositionTimeline, frame: c.size_t, time: c.float, value: c.float) ---
	path_constraint_position_timeline_get_curve_value :: proc(self: PathConstraintPositionTimeline, time: c.float) -> c.float ---
	path_constraint_position_timeline_get_relative_value :: proc(self: PathConstraintPositionTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	path_constraint_position_timeline_get_absolute_value_1 :: proc(self: PathConstraintPositionTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	path_constraint_position_timeline_get_absolute_value_2 :: proc(self: PathConstraintPositionTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float, value: c.float) -> c.float ---
	path_constraint_position_timeline_get_scale_value :: proc(self: PathConstraintPositionTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, current: c.float, setup: c.float) -> c.float ---
	path_constraint_position_timeline_set_linear :: proc(self: PathConstraintPositionTimeline, frame: c.size_t) ---
	path_constraint_position_timeline_set_stepped :: proc(self: PathConstraintPositionTimeline, frame: c.size_t) ---
	path_constraint_position_timeline_set_bezier :: proc(self: PathConstraintPositionTimeline, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	path_constraint_position_timeline_get_bezier_value :: proc(self: PathConstraintPositionTimeline, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	path_constraint_position_timeline_get_curves :: proc(self: PathConstraintPositionTimeline) -> ArrayFloat ---
	path_constraint_position_timeline_get_additive :: proc(self: PathConstraintPositionTimeline) -> c.bool ---
	path_constraint_position_timeline_get_instant :: proc(self: PathConstraintPositionTimeline) -> c.bool ---
	path_constraint_position_timeline_get_frame_entries :: proc(self: PathConstraintPositionTimeline) -> c.size_t ---
	path_constraint_position_timeline_get_frame_count :: proc(self: PathConstraintPositionTimeline) -> c.size_t ---
	path_constraint_position_timeline_get_frames :: proc(self: PathConstraintPositionTimeline) -> ArrayFloat ---
	path_constraint_position_timeline_get_duration :: proc(self: PathConstraintPositionTimeline) -> c.float ---
	path_constraint_position_timeline_get_property_ids :: proc(self: PathConstraintPositionTimeline) -> ArrayPropertyId ---
	path_constraint_position_timeline_rtti :: proc() -> Rtti ---
	path_constraint_spacing_timeline_create :: proc(frame_count: c.size_t, bezier_count: c.size_t, constraint_index: c.int) -> PathConstraintSpacingTimeline ---
	path_constraint_spacing_timeline_dispose :: proc(self: PathConstraintSpacingTimeline) ---
	path_constraint_spacing_timeline_get_rtti :: proc(self: PathConstraintSpacingTimeline) -> Rtti ---
	path_constraint_spacing_timeline_apply :: proc(self: PathConstraintSpacingTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	path_constraint_spacing_timeline_get_constraint_index :: proc(self: PathConstraintSpacingTimeline) -> c.int ---
	path_constraint_spacing_timeline_set_constraint_index :: proc(self: PathConstraintSpacingTimeline, in_value: c.int) ---
	path_constraint_spacing_timeline_set_frame :: proc(self: PathConstraintSpacingTimeline, frame: c.size_t, time: c.float, value: c.float) ---
	path_constraint_spacing_timeline_get_curve_value :: proc(self: PathConstraintSpacingTimeline, time: c.float) -> c.float ---
	path_constraint_spacing_timeline_get_relative_value :: proc(self: PathConstraintSpacingTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	path_constraint_spacing_timeline_get_absolute_value_1 :: proc(self: PathConstraintSpacingTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	path_constraint_spacing_timeline_get_absolute_value_2 :: proc(self: PathConstraintSpacingTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float, value: c.float) -> c.float ---
	path_constraint_spacing_timeline_get_scale_value :: proc(self: PathConstraintSpacingTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, current: c.float, setup: c.float) -> c.float ---
	path_constraint_spacing_timeline_set_linear :: proc(self: PathConstraintSpacingTimeline, frame: c.size_t) ---
	path_constraint_spacing_timeline_set_stepped :: proc(self: PathConstraintSpacingTimeline, frame: c.size_t) ---
	path_constraint_spacing_timeline_set_bezier :: proc(self: PathConstraintSpacingTimeline, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	path_constraint_spacing_timeline_get_bezier_value :: proc(self: PathConstraintSpacingTimeline, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	path_constraint_spacing_timeline_get_curves :: proc(self: PathConstraintSpacingTimeline) -> ArrayFloat ---
	path_constraint_spacing_timeline_get_additive :: proc(self: PathConstraintSpacingTimeline) -> c.bool ---
	path_constraint_spacing_timeline_get_instant :: proc(self: PathConstraintSpacingTimeline) -> c.bool ---
	path_constraint_spacing_timeline_get_frame_entries :: proc(self: PathConstraintSpacingTimeline) -> c.size_t ---
	path_constraint_spacing_timeline_get_frame_count :: proc(self: PathConstraintSpacingTimeline) -> c.size_t ---
	path_constraint_spacing_timeline_get_frames :: proc(self: PathConstraintSpacingTimeline) -> ArrayFloat ---
	path_constraint_spacing_timeline_get_duration :: proc(self: PathConstraintSpacingTimeline) -> c.float ---
	path_constraint_spacing_timeline_get_property_ids :: proc(self: PathConstraintSpacingTimeline) -> ArrayPropertyId ---
	path_constraint_spacing_timeline_rtti :: proc() -> Rtti ---
	physics_constraint_create :: proc(data: PhysicsConstraintData, skeleton: Skeleton) -> PhysicsConstraint ---
	physics_constraint_dispose :: proc(self: PhysicsConstraint) ---
	physics_constraint_get_rtti :: proc(self: PhysicsConstraint) -> Rtti ---
	physics_constraint_update :: proc(self: PhysicsConstraint, skeleton: Skeleton, physics: Physics) ---
	physics_constraint_sort :: proc(self: PhysicsConstraint, skeleton: Skeleton) ---
	physics_constraint_is_source_active :: proc(self: PhysicsConstraint) -> c.bool ---
	physics_constraint_copy :: proc(self: PhysicsConstraint, skeleton: Skeleton) -> PhysicsConstraint ---
	physics_constraint_reset :: proc(self: PhysicsConstraint, skeleton: Skeleton) ---
	physics_constraint_translate :: proc(self: PhysicsConstraint, x: c.float, y: c.float) ---
	physics_constraint_rotate :: proc(self: PhysicsConstraint, x: c.float, y: c.float, degrees: c.float) ---
	physics_constraint_get_bone :: proc(self: PhysicsConstraint) -> BonePose ---
	physics_constraint_set_bone :: proc(self: PhysicsConstraint, bone: BonePose) ---
	physics_constraint_get_data :: proc(self: PhysicsConstraint) -> PhysicsConstraintData ---
	physics_constraint_get_pose :: proc(self: PhysicsConstraint) -> PhysicsConstraintPose ---
	physics_constraint_get_applied_pose :: proc(self: PhysicsConstraint) -> PhysicsConstraintPose ---
	physics_constraint_reset_constrained :: proc(self: PhysicsConstraint) ---
	physics_constraint_constrained :: proc(self: PhysicsConstraint) ---
	physics_constraint_is_pose_equal_to_applied :: proc(self: PhysicsConstraint) -> c.bool ---
	physics_constraint_is_active :: proc(self: PhysicsConstraint) -> c.bool ---
	physics_constraint_set_active :: proc(self: PhysicsConstraint, active: c.bool) ---
	physics_constraint_rtti :: proc() -> Rtti ---
	physics_constraint_base_dispose :: proc(self: PhysicsConstraintBase) ---
	physics_constraint_base_get_data :: proc(self: PhysicsConstraintBase) -> PhysicsConstraintData ---
	physics_constraint_base_get_pose :: proc(self: PhysicsConstraintBase) -> PhysicsConstraintPose ---
	physics_constraint_base_get_applied_pose :: proc(self: PhysicsConstraintBase) -> PhysicsConstraintPose ---
	physics_constraint_base_reset_constrained :: proc(self: PhysicsConstraintBase) ---
	physics_constraint_base_constrained :: proc(self: PhysicsConstraintBase) ---
	physics_constraint_base_is_pose_equal_to_applied :: proc(self: PhysicsConstraintBase) -> c.bool ---
	physics_constraint_base_is_active :: proc(self: PhysicsConstraintBase) -> c.bool ---
	physics_constraint_base_set_active :: proc(self: PhysicsConstraintBase, active: c.bool) ---
	physics_constraint_base_get_rtti :: proc(self: PhysicsConstraintBase) -> Rtti ---
	physics_constraint_base_sort :: proc(self: PhysicsConstraintBase, skeleton: Skeleton) ---
	physics_constraint_base_is_source_active :: proc(self: PhysicsConstraintBase) -> c.bool ---
	physics_constraint_base_update :: proc(self: PhysicsConstraintBase, skeleton: Skeleton, physics: Physics) ---
	physics_constraint_base_rtti :: proc() -> Rtti ---
	physics_constraint_damping_timeline_create :: proc(frame_count: c.size_t, bezier_count: c.size_t, physics_constraint_index: c.int) -> PhysicsConstraintDampingTimeline ---
	physics_constraint_damping_timeline_dispose :: proc(self: PhysicsConstraintDampingTimeline) ---
	physics_constraint_damping_timeline_get_rtti :: proc(self: PhysicsConstraintDampingTimeline) -> Rtti ---
	physics_constraint_damping_timeline_apply :: proc(self: PhysicsConstraintDampingTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	physics_constraint_damping_timeline_get_constraint_index :: proc(self: PhysicsConstraintDampingTimeline) -> c.int ---
	physics_constraint_damping_timeline_set_constraint_index :: proc(self: PhysicsConstraintDampingTimeline, in_value: c.int) ---
	physics_constraint_damping_timeline_set_frame :: proc(self: PhysicsConstraintDampingTimeline, frame: c.size_t, time: c.float, value: c.float) ---
	physics_constraint_damping_timeline_get_curve_value :: proc(self: PhysicsConstraintDampingTimeline, time: c.float) -> c.float ---
	physics_constraint_damping_timeline_get_relative_value :: proc(self: PhysicsConstraintDampingTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	physics_constraint_damping_timeline_get_absolute_value_1 :: proc(self: PhysicsConstraintDampingTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	physics_constraint_damping_timeline_get_absolute_value_2 :: proc(self: PhysicsConstraintDampingTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float, value: c.float) -> c.float ---
	physics_constraint_damping_timeline_get_scale_value :: proc(self: PhysicsConstraintDampingTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, current: c.float, setup: c.float) -> c.float ---
	physics_constraint_damping_timeline_set_linear :: proc(self: PhysicsConstraintDampingTimeline, frame: c.size_t) ---
	physics_constraint_damping_timeline_set_stepped :: proc(self: PhysicsConstraintDampingTimeline, frame: c.size_t) ---
	physics_constraint_damping_timeline_set_bezier :: proc(self: PhysicsConstraintDampingTimeline, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	physics_constraint_damping_timeline_get_bezier_value :: proc(self: PhysicsConstraintDampingTimeline, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	physics_constraint_damping_timeline_get_curves :: proc(self: PhysicsConstraintDampingTimeline) -> ArrayFloat ---
	physics_constraint_damping_timeline_get_additive :: proc(self: PhysicsConstraintDampingTimeline) -> c.bool ---
	physics_constraint_damping_timeline_get_instant :: proc(self: PhysicsConstraintDampingTimeline) -> c.bool ---
	physics_constraint_damping_timeline_get_frame_entries :: proc(self: PhysicsConstraintDampingTimeline) -> c.size_t ---
	physics_constraint_damping_timeline_get_frame_count :: proc(self: PhysicsConstraintDampingTimeline) -> c.size_t ---
	physics_constraint_damping_timeline_get_frames :: proc(self: PhysicsConstraintDampingTimeline) -> ArrayFloat ---
	physics_constraint_damping_timeline_get_duration :: proc(self: PhysicsConstraintDampingTimeline) -> c.float ---
	physics_constraint_damping_timeline_get_property_ids :: proc(self: PhysicsConstraintDampingTimeline) -> ArrayPropertyId ---
	physics_constraint_damping_timeline_rtti :: proc() -> Rtti ---
	physics_constraint_data_create :: proc(name: cstring) -> PhysicsConstraintData ---
	physics_constraint_data_dispose :: proc(self: PhysicsConstraintData) ---
	physics_constraint_data_get_rtti :: proc(self: PhysicsConstraintData) -> Rtti ---
	physics_constraint_data_create_method :: proc(self: PhysicsConstraintData, skeleton: Skeleton) -> Constraint ---
	physics_constraint_data_get_bone :: proc(self: PhysicsConstraintData) -> BoneData ---
	physics_constraint_data_set_bone :: proc(self: PhysicsConstraintData, bone: BoneData) ---
	physics_constraint_data_get_step :: proc(self: PhysicsConstraintData) -> c.float ---
	physics_constraint_data_set_step :: proc(self: PhysicsConstraintData, step: c.float) ---
	physics_constraint_data_get_x :: proc(self: PhysicsConstraintData) -> c.float ---
	physics_constraint_data_set_x :: proc(self: PhysicsConstraintData, x: c.float) ---
	physics_constraint_data_get_y :: proc(self: PhysicsConstraintData) -> c.float ---
	physics_constraint_data_set_y :: proc(self: PhysicsConstraintData, y: c.float) ---
	physics_constraint_data_get_rotate :: proc(self: PhysicsConstraintData) -> c.float ---
	physics_constraint_data_set_rotate :: proc(self: PhysicsConstraintData, rotate: c.float) ---
	physics_constraint_data_get_scale_x :: proc(self: PhysicsConstraintData) -> c.float ---
	physics_constraint_data_set_scale_x :: proc(self: PhysicsConstraintData, scale_x: c.float) ---
	physics_constraint_data_get_shear_x :: proc(self: PhysicsConstraintData) -> c.float ---
	physics_constraint_data_set_shear_x :: proc(self: PhysicsConstraintData, shear_x: c.float) ---
	physics_constraint_data_get_limit :: proc(self: PhysicsConstraintData) -> c.float ---
	physics_constraint_data_set_limit :: proc(self: PhysicsConstraintData, limit: c.float) ---
	physics_constraint_data_get_inertia_global :: proc(self: PhysicsConstraintData) -> c.bool ---
	physics_constraint_data_set_inertia_global :: proc(self: PhysicsConstraintData, inertia_global: c.bool) ---
	physics_constraint_data_get_strength_global :: proc(self: PhysicsConstraintData) -> c.bool ---
	physics_constraint_data_set_strength_global :: proc(self: PhysicsConstraintData, strength_global: c.bool) ---
	physics_constraint_data_get_damping_global :: proc(self: PhysicsConstraintData) -> c.bool ---
	physics_constraint_data_set_damping_global :: proc(self: PhysicsConstraintData, damping_global: c.bool) ---
	physics_constraint_data_get_mass_global :: proc(self: PhysicsConstraintData) -> c.bool ---
	physics_constraint_data_set_mass_global :: proc(self: PhysicsConstraintData, mass_global: c.bool) ---
	physics_constraint_data_get_wind_global :: proc(self: PhysicsConstraintData) -> c.bool ---
	physics_constraint_data_set_wind_global :: proc(self: PhysicsConstraintData, wind_global: c.bool) ---
	physics_constraint_data_get_gravity_global :: proc(self: PhysicsConstraintData) -> c.bool ---
	physics_constraint_data_set_gravity_global :: proc(self: PhysicsConstraintData, gravity_global: c.bool) ---
	physics_constraint_data_get_mix_global :: proc(self: PhysicsConstraintData) -> c.bool ---
	physics_constraint_data_set_mix_global :: proc(self: PhysicsConstraintData, mix_global: c.bool) ---
	physics_constraint_data_get_name :: proc(self: PhysicsConstraintData) -> cstring ---
	physics_constraint_data_get_skin_required :: proc(self: PhysicsConstraintData) -> c.bool ---
	physics_constraint_data_get_setup_pose :: proc(self: PhysicsConstraintData) -> PhysicsConstraintPose ---
	physics_constraint_data_set_skin_required :: proc(self: PhysicsConstraintData, skin_required: c.bool) ---
	physics_constraint_data_rtti :: proc() -> Rtti ---
	physics_constraint_gravity_timeline_create :: proc(frame_count: c.size_t, bezier_count: c.size_t, physics_constraint_index: c.int) -> PhysicsConstraintGravityTimeline ---
	physics_constraint_gravity_timeline_dispose :: proc(self: PhysicsConstraintGravityTimeline) ---
	physics_constraint_gravity_timeline_get_rtti :: proc(self: PhysicsConstraintGravityTimeline) -> Rtti ---
	physics_constraint_gravity_timeline_apply :: proc(self: PhysicsConstraintGravityTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	physics_constraint_gravity_timeline_get_constraint_index :: proc(self: PhysicsConstraintGravityTimeline) -> c.int ---
	physics_constraint_gravity_timeline_set_constraint_index :: proc(self: PhysicsConstraintGravityTimeline, in_value: c.int) ---
	physics_constraint_gravity_timeline_set_frame :: proc(self: PhysicsConstraintGravityTimeline, frame: c.size_t, time: c.float, value: c.float) ---
	physics_constraint_gravity_timeline_get_curve_value :: proc(self: PhysicsConstraintGravityTimeline, time: c.float) -> c.float ---
	physics_constraint_gravity_timeline_get_relative_value :: proc(self: PhysicsConstraintGravityTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	physics_constraint_gravity_timeline_get_absolute_value_1 :: proc(self: PhysicsConstraintGravityTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	physics_constraint_gravity_timeline_get_absolute_value_2 :: proc(self: PhysicsConstraintGravityTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float, value: c.float) -> c.float ---
	physics_constraint_gravity_timeline_get_scale_value :: proc(self: PhysicsConstraintGravityTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, current: c.float, setup: c.float) -> c.float ---
	physics_constraint_gravity_timeline_set_linear :: proc(self: PhysicsConstraintGravityTimeline, frame: c.size_t) ---
	physics_constraint_gravity_timeline_set_stepped :: proc(self: PhysicsConstraintGravityTimeline, frame: c.size_t) ---
	physics_constraint_gravity_timeline_set_bezier :: proc(self: PhysicsConstraintGravityTimeline, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	physics_constraint_gravity_timeline_get_bezier_value :: proc(self: PhysicsConstraintGravityTimeline, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	physics_constraint_gravity_timeline_get_curves :: proc(self: PhysicsConstraintGravityTimeline) -> ArrayFloat ---
	physics_constraint_gravity_timeline_get_additive :: proc(self: PhysicsConstraintGravityTimeline) -> c.bool ---
	physics_constraint_gravity_timeline_get_instant :: proc(self: PhysicsConstraintGravityTimeline) -> c.bool ---
	physics_constraint_gravity_timeline_get_frame_entries :: proc(self: PhysicsConstraintGravityTimeline) -> c.size_t ---
	physics_constraint_gravity_timeline_get_frame_count :: proc(self: PhysicsConstraintGravityTimeline) -> c.size_t ---
	physics_constraint_gravity_timeline_get_frames :: proc(self: PhysicsConstraintGravityTimeline) -> ArrayFloat ---
	physics_constraint_gravity_timeline_get_duration :: proc(self: PhysicsConstraintGravityTimeline) -> c.float ---
	physics_constraint_gravity_timeline_get_property_ids :: proc(self: PhysicsConstraintGravityTimeline) -> ArrayPropertyId ---
	physics_constraint_gravity_timeline_rtti :: proc() -> Rtti ---
	physics_constraint_inertia_timeline_create :: proc(frame_count: c.size_t, bezier_count: c.size_t, physics_constraint_index: c.int) -> PhysicsConstraintInertiaTimeline ---
	physics_constraint_inertia_timeline_dispose :: proc(self: PhysicsConstraintInertiaTimeline) ---
	physics_constraint_inertia_timeline_get_rtti :: proc(self: PhysicsConstraintInertiaTimeline) -> Rtti ---
	physics_constraint_inertia_timeline_apply :: proc(self: PhysicsConstraintInertiaTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	physics_constraint_inertia_timeline_get_constraint_index :: proc(self: PhysicsConstraintInertiaTimeline) -> c.int ---
	physics_constraint_inertia_timeline_set_constraint_index :: proc(self: PhysicsConstraintInertiaTimeline, in_value: c.int) ---
	physics_constraint_inertia_timeline_set_frame :: proc(self: PhysicsConstraintInertiaTimeline, frame: c.size_t, time: c.float, value: c.float) ---
	physics_constraint_inertia_timeline_get_curve_value :: proc(self: PhysicsConstraintInertiaTimeline, time: c.float) -> c.float ---
	physics_constraint_inertia_timeline_get_relative_value :: proc(self: PhysicsConstraintInertiaTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	physics_constraint_inertia_timeline_get_absolute_value_1 :: proc(self: PhysicsConstraintInertiaTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	physics_constraint_inertia_timeline_get_absolute_value_2 :: proc(self: PhysicsConstraintInertiaTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float, value: c.float) -> c.float ---
	physics_constraint_inertia_timeline_get_scale_value :: proc(self: PhysicsConstraintInertiaTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, current: c.float, setup: c.float) -> c.float ---
	physics_constraint_inertia_timeline_set_linear :: proc(self: PhysicsConstraintInertiaTimeline, frame: c.size_t) ---
	physics_constraint_inertia_timeline_set_stepped :: proc(self: PhysicsConstraintInertiaTimeline, frame: c.size_t) ---
	physics_constraint_inertia_timeline_set_bezier :: proc(self: PhysicsConstraintInertiaTimeline, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	physics_constraint_inertia_timeline_get_bezier_value :: proc(self: PhysicsConstraintInertiaTimeline, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	physics_constraint_inertia_timeline_get_curves :: proc(self: PhysicsConstraintInertiaTimeline) -> ArrayFloat ---
	physics_constraint_inertia_timeline_get_additive :: proc(self: PhysicsConstraintInertiaTimeline) -> c.bool ---
	physics_constraint_inertia_timeline_get_instant :: proc(self: PhysicsConstraintInertiaTimeline) -> c.bool ---
	physics_constraint_inertia_timeline_get_frame_entries :: proc(self: PhysicsConstraintInertiaTimeline) -> c.size_t ---
	physics_constraint_inertia_timeline_get_frame_count :: proc(self: PhysicsConstraintInertiaTimeline) -> c.size_t ---
	physics_constraint_inertia_timeline_get_frames :: proc(self: PhysicsConstraintInertiaTimeline) -> ArrayFloat ---
	physics_constraint_inertia_timeline_get_duration :: proc(self: PhysicsConstraintInertiaTimeline) -> c.float ---
	physics_constraint_inertia_timeline_get_property_ids :: proc(self: PhysicsConstraintInertiaTimeline) -> ArrayPropertyId ---
	physics_constraint_inertia_timeline_rtti :: proc() -> Rtti ---
	physics_constraint_mass_timeline_create :: proc(frame_count: c.size_t, bezier_count: c.size_t, physics_constraint_index: c.int) -> PhysicsConstraintMassTimeline ---
	physics_constraint_mass_timeline_dispose :: proc(self: PhysicsConstraintMassTimeline) ---
	physics_constraint_mass_timeline_get_rtti :: proc(self: PhysicsConstraintMassTimeline) -> Rtti ---
	physics_constraint_mass_timeline_apply :: proc(self: PhysicsConstraintMassTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	physics_constraint_mass_timeline_get_constraint_index :: proc(self: PhysicsConstraintMassTimeline) -> c.int ---
	physics_constraint_mass_timeline_set_constraint_index :: proc(self: PhysicsConstraintMassTimeline, in_value: c.int) ---
	physics_constraint_mass_timeline_set_frame :: proc(self: PhysicsConstraintMassTimeline, frame: c.size_t, time: c.float, value: c.float) ---
	physics_constraint_mass_timeline_get_curve_value :: proc(self: PhysicsConstraintMassTimeline, time: c.float) -> c.float ---
	physics_constraint_mass_timeline_get_relative_value :: proc(self: PhysicsConstraintMassTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	physics_constraint_mass_timeline_get_absolute_value_1 :: proc(self: PhysicsConstraintMassTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	physics_constraint_mass_timeline_get_absolute_value_2 :: proc(self: PhysicsConstraintMassTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float, value: c.float) -> c.float ---
	physics_constraint_mass_timeline_get_scale_value :: proc(self: PhysicsConstraintMassTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, current: c.float, setup: c.float) -> c.float ---
	physics_constraint_mass_timeline_set_linear :: proc(self: PhysicsConstraintMassTimeline, frame: c.size_t) ---
	physics_constraint_mass_timeline_set_stepped :: proc(self: PhysicsConstraintMassTimeline, frame: c.size_t) ---
	physics_constraint_mass_timeline_set_bezier :: proc(self: PhysicsConstraintMassTimeline, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	physics_constraint_mass_timeline_get_bezier_value :: proc(self: PhysicsConstraintMassTimeline, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	physics_constraint_mass_timeline_get_curves :: proc(self: PhysicsConstraintMassTimeline) -> ArrayFloat ---
	physics_constraint_mass_timeline_get_additive :: proc(self: PhysicsConstraintMassTimeline) -> c.bool ---
	physics_constraint_mass_timeline_get_instant :: proc(self: PhysicsConstraintMassTimeline) -> c.bool ---
	physics_constraint_mass_timeline_get_frame_entries :: proc(self: PhysicsConstraintMassTimeline) -> c.size_t ---
	physics_constraint_mass_timeline_get_frame_count :: proc(self: PhysicsConstraintMassTimeline) -> c.size_t ---
	physics_constraint_mass_timeline_get_frames :: proc(self: PhysicsConstraintMassTimeline) -> ArrayFloat ---
	physics_constraint_mass_timeline_get_duration :: proc(self: PhysicsConstraintMassTimeline) -> c.float ---
	physics_constraint_mass_timeline_get_property_ids :: proc(self: PhysicsConstraintMassTimeline) -> ArrayPropertyId ---
	physics_constraint_mass_timeline_rtti :: proc() -> Rtti ---
	physics_constraint_mix_timeline_create :: proc(frame_count: c.size_t, bezier_count: c.size_t, physics_constraint_index: c.int) -> PhysicsConstraintMixTimeline ---
	physics_constraint_mix_timeline_dispose :: proc(self: PhysicsConstraintMixTimeline) ---
	physics_constraint_mix_timeline_get_rtti :: proc(self: PhysicsConstraintMixTimeline) -> Rtti ---
	physics_constraint_mix_timeline_apply :: proc(self: PhysicsConstraintMixTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	physics_constraint_mix_timeline_get_constraint_index :: proc(self: PhysicsConstraintMixTimeline) -> c.int ---
	physics_constraint_mix_timeline_set_constraint_index :: proc(self: PhysicsConstraintMixTimeline, in_value: c.int) ---
	physics_constraint_mix_timeline_set_frame :: proc(self: PhysicsConstraintMixTimeline, frame: c.size_t, time: c.float, value: c.float) ---
	physics_constraint_mix_timeline_get_curve_value :: proc(self: PhysicsConstraintMixTimeline, time: c.float) -> c.float ---
	physics_constraint_mix_timeline_get_relative_value :: proc(self: PhysicsConstraintMixTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	physics_constraint_mix_timeline_get_absolute_value_1 :: proc(self: PhysicsConstraintMixTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	physics_constraint_mix_timeline_get_absolute_value_2 :: proc(self: PhysicsConstraintMixTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float, value: c.float) -> c.float ---
	physics_constraint_mix_timeline_get_scale_value :: proc(self: PhysicsConstraintMixTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, current: c.float, setup: c.float) -> c.float ---
	physics_constraint_mix_timeline_set_linear :: proc(self: PhysicsConstraintMixTimeline, frame: c.size_t) ---
	physics_constraint_mix_timeline_set_stepped :: proc(self: PhysicsConstraintMixTimeline, frame: c.size_t) ---
	physics_constraint_mix_timeline_set_bezier :: proc(self: PhysicsConstraintMixTimeline, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	physics_constraint_mix_timeline_get_bezier_value :: proc(self: PhysicsConstraintMixTimeline, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	physics_constraint_mix_timeline_get_curves :: proc(self: PhysicsConstraintMixTimeline) -> ArrayFloat ---
	physics_constraint_mix_timeline_get_additive :: proc(self: PhysicsConstraintMixTimeline) -> c.bool ---
	physics_constraint_mix_timeline_get_instant :: proc(self: PhysicsConstraintMixTimeline) -> c.bool ---
	physics_constraint_mix_timeline_get_frame_entries :: proc(self: PhysicsConstraintMixTimeline) -> c.size_t ---
	physics_constraint_mix_timeline_get_frame_count :: proc(self: PhysicsConstraintMixTimeline) -> c.size_t ---
	physics_constraint_mix_timeline_get_frames :: proc(self: PhysicsConstraintMixTimeline) -> ArrayFloat ---
	physics_constraint_mix_timeline_get_duration :: proc(self: PhysicsConstraintMixTimeline) -> c.float ---
	physics_constraint_mix_timeline_get_property_ids :: proc(self: PhysicsConstraintMixTimeline) -> ArrayPropertyId ---
	physics_constraint_mix_timeline_rtti :: proc() -> Rtti ---
	physics_constraint_pose_create :: proc() -> PhysicsConstraintPose ---
	physics_constraint_pose_dispose :: proc(self: PhysicsConstraintPose) ---
	physics_constraint_pose_set :: proc(self: PhysicsConstraintPose, pose: PhysicsConstraintPose) ---
	physics_constraint_pose_get_inertia :: proc(self: PhysicsConstraintPose) -> c.float ---
	physics_constraint_pose_set_inertia :: proc(self: PhysicsConstraintPose, inertia: c.float) ---
	physics_constraint_pose_get_strength :: proc(self: PhysicsConstraintPose) -> c.float ---
	physics_constraint_pose_set_strength :: proc(self: PhysicsConstraintPose, strength: c.float) ---
	physics_constraint_pose_get_damping :: proc(self: PhysicsConstraintPose) -> c.float ---
	physics_constraint_pose_set_damping :: proc(self: PhysicsConstraintPose, damping: c.float) ---
	physics_constraint_pose_get_mass_inverse :: proc(self: PhysicsConstraintPose) -> c.float ---
	physics_constraint_pose_set_mass_inverse :: proc(self: PhysicsConstraintPose, mass_inverse: c.float) ---
	physics_constraint_pose_get_wind :: proc(self: PhysicsConstraintPose) -> c.float ---
	physics_constraint_pose_set_wind :: proc(self: PhysicsConstraintPose, wind: c.float) ---
	physics_constraint_pose_get_gravity :: proc(self: PhysicsConstraintPose) -> c.float ---
	physics_constraint_pose_set_gravity :: proc(self: PhysicsConstraintPose, gravity: c.float) ---
	physics_constraint_pose_get_mix :: proc(self: PhysicsConstraintPose) -> c.float ---
	physics_constraint_pose_set_mix :: proc(self: PhysicsConstraintPose, mix: c.float) ---
	physics_constraint_reset_timeline_create :: proc(frame_count: c.size_t, constraint_index: c.int) -> PhysicsConstraintResetTimeline ---
	physics_constraint_reset_timeline_dispose :: proc(self: PhysicsConstraintResetTimeline) ---
	physics_constraint_reset_timeline_get_rtti :: proc(self: PhysicsConstraintResetTimeline) -> Rtti ---
	physics_constraint_reset_timeline_apply :: proc(self: PhysicsConstraintResetTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	physics_constraint_reset_timeline_get_frame_count :: proc(self: PhysicsConstraintResetTimeline) -> c.int ---
	physics_constraint_reset_timeline_get_constraint_index :: proc(self: PhysicsConstraintResetTimeline) -> c.int ---
	physics_constraint_reset_timeline_set_constraint_index :: proc(self: PhysicsConstraintResetTimeline, in_value: c.int) ---
	physics_constraint_reset_timeline_set_frame :: proc(self: PhysicsConstraintResetTimeline, frame: c.int, time: c.float) ---
	physics_constraint_reset_timeline_get_additive :: proc(self: PhysicsConstraintResetTimeline) -> c.bool ---
	physics_constraint_reset_timeline_get_instant :: proc(self: PhysicsConstraintResetTimeline) -> c.bool ---
	physics_constraint_reset_timeline_get_frame_entries :: proc(self: PhysicsConstraintResetTimeline) -> c.size_t ---
	physics_constraint_reset_timeline_get_frames :: proc(self: PhysicsConstraintResetTimeline) -> ArrayFloat ---
	physics_constraint_reset_timeline_get_duration :: proc(self: PhysicsConstraintResetTimeline) -> c.float ---
	physics_constraint_reset_timeline_get_property_ids :: proc(self: PhysicsConstraintResetTimeline) -> ArrayPropertyId ---
	physics_constraint_reset_timeline_rtti :: proc() -> Rtti ---
	physics_constraint_strength_timeline_create :: proc(frame_count: c.size_t, bezier_count: c.size_t, physics_constraint_index: c.int) -> PhysicsConstraintStrengthTimeline ---
	physics_constraint_strength_timeline_dispose :: proc(self: PhysicsConstraintStrengthTimeline) ---
	physics_constraint_strength_timeline_get_rtti :: proc(self: PhysicsConstraintStrengthTimeline) -> Rtti ---
	physics_constraint_strength_timeline_apply :: proc(self: PhysicsConstraintStrengthTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	physics_constraint_strength_timeline_get_constraint_index :: proc(self: PhysicsConstraintStrengthTimeline) -> c.int ---
	physics_constraint_strength_timeline_set_constraint_index :: proc(self: PhysicsConstraintStrengthTimeline, in_value: c.int) ---
	physics_constraint_strength_timeline_set_frame :: proc(self: PhysicsConstraintStrengthTimeline, frame: c.size_t, time: c.float, value: c.float) ---
	physics_constraint_strength_timeline_get_curve_value :: proc(self: PhysicsConstraintStrengthTimeline, time: c.float) -> c.float ---
	physics_constraint_strength_timeline_get_relative_value :: proc(self: PhysicsConstraintStrengthTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	physics_constraint_strength_timeline_get_absolute_value_1 :: proc(self: PhysicsConstraintStrengthTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	physics_constraint_strength_timeline_get_absolute_value_2 :: proc(self: PhysicsConstraintStrengthTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float, value: c.float) -> c.float ---
	physics_constraint_strength_timeline_get_scale_value :: proc(self: PhysicsConstraintStrengthTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, current: c.float, setup: c.float) -> c.float ---
	physics_constraint_strength_timeline_set_linear :: proc(self: PhysicsConstraintStrengthTimeline, frame: c.size_t) ---
	physics_constraint_strength_timeline_set_stepped :: proc(self: PhysicsConstraintStrengthTimeline, frame: c.size_t) ---
	physics_constraint_strength_timeline_set_bezier :: proc(self: PhysicsConstraintStrengthTimeline, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	physics_constraint_strength_timeline_get_bezier_value :: proc(self: PhysicsConstraintStrengthTimeline, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	physics_constraint_strength_timeline_get_curves :: proc(self: PhysicsConstraintStrengthTimeline) -> ArrayFloat ---
	physics_constraint_strength_timeline_get_additive :: proc(self: PhysicsConstraintStrengthTimeline) -> c.bool ---
	physics_constraint_strength_timeline_get_instant :: proc(self: PhysicsConstraintStrengthTimeline) -> c.bool ---
	physics_constraint_strength_timeline_get_frame_entries :: proc(self: PhysicsConstraintStrengthTimeline) -> c.size_t ---
	physics_constraint_strength_timeline_get_frame_count :: proc(self: PhysicsConstraintStrengthTimeline) -> c.size_t ---
	physics_constraint_strength_timeline_get_frames :: proc(self: PhysicsConstraintStrengthTimeline) -> ArrayFloat ---
	physics_constraint_strength_timeline_get_duration :: proc(self: PhysicsConstraintStrengthTimeline) -> c.float ---
	physics_constraint_strength_timeline_get_property_ids :: proc(self: PhysicsConstraintStrengthTimeline) -> ArrayPropertyId ---
	physics_constraint_strength_timeline_rtti :: proc() -> Rtti ---
	physics_constraint_timeline_dispose :: proc(self: PhysicsConstraintTimeline) ---
	physics_constraint_timeline_get_rtti :: proc(self: PhysicsConstraintTimeline) -> Rtti ---
	physics_constraint_timeline_apply :: proc(self: PhysicsConstraintTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	physics_constraint_timeline_get_constraint_index :: proc(self: PhysicsConstraintTimeline) -> c.int ---
	physics_constraint_timeline_set_constraint_index :: proc(self: PhysicsConstraintTimeline, in_value: c.int) ---
	physics_constraint_timeline_set_frame :: proc(self: PhysicsConstraintTimeline, frame: c.size_t, time: c.float, value: c.float) ---
	physics_constraint_timeline_get_curve_value :: proc(self: PhysicsConstraintTimeline, time: c.float) -> c.float ---
	physics_constraint_timeline_get_relative_value :: proc(self: PhysicsConstraintTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	physics_constraint_timeline_get_absolute_value_1 :: proc(self: PhysicsConstraintTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	physics_constraint_timeline_get_absolute_value_2 :: proc(self: PhysicsConstraintTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float, value: c.float) -> c.float ---
	physics_constraint_timeline_get_scale_value :: proc(self: PhysicsConstraintTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, current: c.float, setup: c.float) -> c.float ---
	physics_constraint_timeline_set_linear :: proc(self: PhysicsConstraintTimeline, frame: c.size_t) ---
	physics_constraint_timeline_set_stepped :: proc(self: PhysicsConstraintTimeline, frame: c.size_t) ---
	physics_constraint_timeline_set_bezier :: proc(self: PhysicsConstraintTimeline, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	physics_constraint_timeline_get_bezier_value :: proc(self: PhysicsConstraintTimeline, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	physics_constraint_timeline_get_curves :: proc(self: PhysicsConstraintTimeline) -> ArrayFloat ---
	physics_constraint_timeline_get_additive :: proc(self: PhysicsConstraintTimeline) -> c.bool ---
	physics_constraint_timeline_get_instant :: proc(self: PhysicsConstraintTimeline) -> c.bool ---
	physics_constraint_timeline_get_frame_entries :: proc(self: PhysicsConstraintTimeline) -> c.size_t ---
	physics_constraint_timeline_get_frame_count :: proc(self: PhysicsConstraintTimeline) -> c.size_t ---
	physics_constraint_timeline_get_frames :: proc(self: PhysicsConstraintTimeline) -> ArrayFloat ---
	physics_constraint_timeline_get_duration :: proc(self: PhysicsConstraintTimeline) -> c.float ---
	physics_constraint_timeline_get_property_ids :: proc(self: PhysicsConstraintTimeline) -> ArrayPropertyId ---
	physics_constraint_timeline_rtti :: proc() -> Rtti ---
	physics_constraint_wind_timeline_create :: proc(frame_count: c.size_t, bezier_count: c.size_t, physics_constraint_index: c.int) -> PhysicsConstraintWindTimeline ---
	physics_constraint_wind_timeline_dispose :: proc(self: PhysicsConstraintWindTimeline) ---
	physics_constraint_wind_timeline_get_rtti :: proc(self: PhysicsConstraintWindTimeline) -> Rtti ---
	physics_constraint_wind_timeline_apply :: proc(self: PhysicsConstraintWindTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	physics_constraint_wind_timeline_get_constraint_index :: proc(self: PhysicsConstraintWindTimeline) -> c.int ---
	physics_constraint_wind_timeline_set_constraint_index :: proc(self: PhysicsConstraintWindTimeline, in_value: c.int) ---
	physics_constraint_wind_timeline_set_frame :: proc(self: PhysicsConstraintWindTimeline, frame: c.size_t, time: c.float, value: c.float) ---
	physics_constraint_wind_timeline_get_curve_value :: proc(self: PhysicsConstraintWindTimeline, time: c.float) -> c.float ---
	physics_constraint_wind_timeline_get_relative_value :: proc(self: PhysicsConstraintWindTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	physics_constraint_wind_timeline_get_absolute_value_1 :: proc(self: PhysicsConstraintWindTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	physics_constraint_wind_timeline_get_absolute_value_2 :: proc(self: PhysicsConstraintWindTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float, value: c.float) -> c.float ---
	physics_constraint_wind_timeline_get_scale_value :: proc(self: PhysicsConstraintWindTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, current: c.float, setup: c.float) -> c.float ---
	physics_constraint_wind_timeline_set_linear :: proc(self: PhysicsConstraintWindTimeline, frame: c.size_t) ---
	physics_constraint_wind_timeline_set_stepped :: proc(self: PhysicsConstraintWindTimeline, frame: c.size_t) ---
	physics_constraint_wind_timeline_set_bezier :: proc(self: PhysicsConstraintWindTimeline, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	physics_constraint_wind_timeline_get_bezier_value :: proc(self: PhysicsConstraintWindTimeline, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	physics_constraint_wind_timeline_get_curves :: proc(self: PhysicsConstraintWindTimeline) -> ArrayFloat ---
	physics_constraint_wind_timeline_get_additive :: proc(self: PhysicsConstraintWindTimeline) -> c.bool ---
	physics_constraint_wind_timeline_get_instant :: proc(self: PhysicsConstraintWindTimeline) -> c.bool ---
	physics_constraint_wind_timeline_get_frame_entries :: proc(self: PhysicsConstraintWindTimeline) -> c.size_t ---
	physics_constraint_wind_timeline_get_frame_count :: proc(self: PhysicsConstraintWindTimeline) -> c.size_t ---
	physics_constraint_wind_timeline_get_frames :: proc(self: PhysicsConstraintWindTimeline) -> ArrayFloat ---
	physics_constraint_wind_timeline_get_duration :: proc(self: PhysicsConstraintWindTimeline) -> c.float ---
	physics_constraint_wind_timeline_get_property_ids :: proc(self: PhysicsConstraintWindTimeline) -> ArrayPropertyId ---
	physics_constraint_wind_timeline_rtti :: proc() -> Rtti ---
	point_attachment_create :: proc(name: cstring) -> PointAttachment ---
	point_attachment_dispose :: proc(self: PointAttachment) ---
	point_attachment_get_rtti :: proc(self: PointAttachment) -> Rtti ---
	point_attachment_get_x :: proc(self: PointAttachment) -> c.float ---
	point_attachment_set_x :: proc(self: PointAttachment, in_value: c.float) ---
	point_attachment_get_y :: proc(self: PointAttachment) -> c.float ---
	point_attachment_set_y :: proc(self: PointAttachment, in_value: c.float) ---
	point_attachment_get_rotation :: proc(self: PointAttachment) -> c.float ---
	point_attachment_set_rotation :: proc(self: PointAttachment, in_value: c.float) ---
	point_attachment_get_color :: proc(self: PointAttachment) -> Color ---
	point_attachment_compute_world_position :: proc(self: PointAttachment, bone: BonePose, ox: [^]c.float, oy: [^]c.float) ---
	point_attachment_compute_world_rotation :: proc(self: PointAttachment, bone: BonePose) -> c.float ---
	point_attachment_copy :: proc(self: PointAttachment) -> Attachment ---
	point_attachment_get_name :: proc(self: PointAttachment) -> cstring ---
	point_attachment_get_timeline_attachment :: proc(self: PointAttachment) -> Attachment ---
	point_attachment_set_timeline_attachment :: proc(self: PointAttachment, attachment: Attachment) ---
	point_attachment_get_timeline_slots :: proc(self: PointAttachment) -> ArrayInt ---
	point_attachment_set_timeline_slots :: proc(self: PointAttachment, timeline_slots: ArrayInt) ---
	point_attachment_is_timeline_active :: proc(self: PointAttachment, slots: ArraySlot, slot_index: c.int, applied_pose: c.bool) -> c.bool ---
	point_attachment_get_ref_count :: proc(self: PointAttachment) -> c.int ---
	point_attachment_reference :: proc(self: PointAttachment) ---
	point_attachment_dereference :: proc(self: PointAttachment) ---
	point_attachment_rtti :: proc() -> Rtti ---
	polygon_create :: proc() -> Polygon ---
	polygon_dispose :: proc(self: Polygon) ---
	polygon_get__vertices :: proc(self: Polygon) -> ArrayFloat ---
	polygon_set__vertices :: proc(self: Polygon, value: ArrayFloat) ---
	polygon_get__count :: proc(self: Polygon) -> c.int ---
	polygon_set__count :: proc(self: Polygon, value: c.int) ---
	posed_dispose :: proc(self: Posed) ---
	posed_constrained :: proc(self: Posed) ---
	posed_reset_constrained :: proc(self: Posed) ---
	posed_is_pose_equal_to_applied :: proc(self: Posed) -> c.bool ---
	posed_active_dispose :: proc(self: PosedActive) ---
	posed_active_is_active :: proc(self: PosedActive) -> c.bool ---
	posed_active_set_active :: proc(self: PosedActive, active: c.bool) ---
	posed_data_create :: proc(name: cstring) -> PosedData ---
	posed_data_dispose :: proc(self: PosedData) ---
	posed_data_get_name :: proc(self: PosedData) -> cstring ---
	posed_data_get_skin_required :: proc(self: PosedData) -> c.bool ---
	posed_data_set_skin_required :: proc(self: PosedData, skin_required: c.bool) ---
	region_attachment_create :: proc(name: cstring, sequence: Sequence) -> RegionAttachment ---
	region_attachment_dispose :: proc(self: RegionAttachment) ---
	region_attachment_get_rtti :: proc(self: RegionAttachment) -> Rtti ---
	region_attachment_compute_world_vertices_1 :: proc(self: RegionAttachment, slot: Slot, vertex_offsets: [^]c.float, world_vertices: [^]c.float, offset: c.size_t, stride: c.size_t) ---
	region_attachment_compute_world_vertices_2 :: proc(self: RegionAttachment, slot: Slot, vertex_offsets: ArrayFloat, world_vertices: ArrayFloat, offset: c.size_t, stride: c.size_t) ---
	region_attachment_get_offsets :: proc(self: RegionAttachment, pose: SlotPose) -> ArrayFloat ---
	region_attachment_get_x :: proc(self: RegionAttachment) -> c.float ---
	region_attachment_set_x :: proc(self: RegionAttachment, in_value: c.float) ---
	region_attachment_get_y :: proc(self: RegionAttachment) -> c.float ---
	region_attachment_set_y :: proc(self: RegionAttachment, in_value: c.float) ---
	region_attachment_get_scale_x :: proc(self: RegionAttachment) -> c.float ---
	region_attachment_set_scale_x :: proc(self: RegionAttachment, in_value: c.float) ---
	region_attachment_get_scale_y :: proc(self: RegionAttachment) -> c.float ---
	region_attachment_set_scale_y :: proc(self: RegionAttachment, in_value: c.float) ---
	region_attachment_get_rotation :: proc(self: RegionAttachment) -> c.float ---
	region_attachment_set_rotation :: proc(self: RegionAttachment, in_value: c.float) ---
	region_attachment_get_width :: proc(self: RegionAttachment) -> c.float ---
	region_attachment_set_width :: proc(self: RegionAttachment, in_value: c.float) ---
	region_attachment_get_height :: proc(self: RegionAttachment) -> c.float ---
	region_attachment_set_height :: proc(self: RegionAttachment, in_value: c.float) ---
	region_attachment_get_sequence :: proc(self: RegionAttachment) -> Sequence ---
	region_attachment_update_sequence :: proc(self: RegionAttachment) ---
	region_attachment_get_path :: proc(self: RegionAttachment) -> cstring ---
	region_attachment_set_path :: proc(self: RegionAttachment, in_value: cstring) ---
	region_attachment_get_color :: proc(self: RegionAttachment) -> Color ---
	region_attachment_copy :: proc(self: RegionAttachment) -> Attachment ---
	region_attachment_compute_u_vs :: proc(region: TextureRegion, x: c.float, y: c.float, scale_x: c.float, scale_y: c.float, rotation: c.float, width: c.float, height: c.float, offset: ArrayFloat, uvs: ArrayFloat) ---
	region_attachment_get_name :: proc(self: RegionAttachment) -> cstring ---
	region_attachment_get_timeline_attachment :: proc(self: RegionAttachment) -> Attachment ---
	region_attachment_set_timeline_attachment :: proc(self: RegionAttachment, attachment: Attachment) ---
	region_attachment_get_timeline_slots :: proc(self: RegionAttachment) -> ArrayInt ---
	region_attachment_set_timeline_slots :: proc(self: RegionAttachment, timeline_slots: ArrayInt) ---
	region_attachment_is_timeline_active :: proc(self: RegionAttachment, slots: ArraySlot, slot_index: c.int, applied_pose: c.bool) -> c.bool ---
	region_attachment_get_ref_count :: proc(self: RegionAttachment) -> c.int ---
	region_attachment_reference :: proc(self: RegionAttachment) ---
	region_attachment_dereference :: proc(self: RegionAttachment) ---
	region_attachment_rtti :: proc() -> Rtti ---
	render_command_dispose :: proc(self: RenderCommand) ---
	render_command_get_positions :: proc(self: RenderCommand) -> [^]c.float ---
	render_command_get_uvs :: proc(self: RenderCommand) -> [^]c.float ---
	render_command_get_colors :: proc(self: RenderCommand) -> [^]c.uint32_t ---
	render_command_get_dark_colors :: proc(self: RenderCommand) -> [^]c.uint32_t ---
	render_command_get_num_vertices :: proc(self: RenderCommand) -> c.int32_t ---
	render_command_get_indices :: proc(self: RenderCommand) -> [^]c.uint16_t ---
	render_command_get_num_indices :: proc(self: RenderCommand) -> c.int32_t ---
	render_command_get_blend_mode :: proc(self: RenderCommand) -> BlendMode ---
	render_command_get_texture :: proc(self: RenderCommand) -> rawptr ---
	render_command_get_next :: proc(self: RenderCommand) -> RenderCommand ---
	rgb2_timeline_create :: proc(frame_count: c.size_t, bezier_count: c.size_t, slot_index: c.int) -> Rgb2Timeline ---
	rgb2_timeline_dispose :: proc(self: Rgb2Timeline) ---
	rgb2_timeline_get_rtti :: proc(self: Rgb2Timeline) -> Rtti ---
	rgb2_timeline_set_frame :: proc(self: Rgb2Timeline, frame: c.int, time: c.float, r: c.float, g: c.float, b: c.float, r2: c.float, g2: c.float, b2: c.float) ---
	rgb2_timeline_apply :: proc(self: Rgb2Timeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	rgb2_timeline_get_slot_index :: proc(self: Rgb2Timeline) -> c.int ---
	rgb2_timeline_set_slot_index :: proc(self: Rgb2Timeline, in_value: c.int) ---
	rgb2_timeline_set_linear :: proc(self: Rgb2Timeline, frame: c.size_t) ---
	rgb2_timeline_set_stepped :: proc(self: Rgb2Timeline, frame: c.size_t) ---
	rgb2_timeline_set_bezier :: proc(self: Rgb2Timeline, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	rgb2_timeline_get_bezier_value :: proc(self: Rgb2Timeline, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	rgb2_timeline_get_curves :: proc(self: Rgb2Timeline) -> ArrayFloat ---
	rgb2_timeline_get_additive :: proc(self: Rgb2Timeline) -> c.bool ---
	rgb2_timeline_get_instant :: proc(self: Rgb2Timeline) -> c.bool ---
	rgb2_timeline_get_frame_entries :: proc(self: Rgb2Timeline) -> c.size_t ---
	rgb2_timeline_get_frame_count :: proc(self: Rgb2Timeline) -> c.size_t ---
	rgb2_timeline_get_frames :: proc(self: Rgb2Timeline) -> ArrayFloat ---
	rgb2_timeline_get_duration :: proc(self: Rgb2Timeline) -> c.float ---
	rgb2_timeline_get_property_ids :: proc(self: Rgb2Timeline) -> ArrayPropertyId ---
	rgb2_timeline_rtti :: proc() -> Rtti ---
	rgb_timeline_create :: proc(frame_count: c.size_t, bezier_count: c.size_t, slot_index: c.int) -> RgbTimeline ---
	rgb_timeline_dispose :: proc(self: RgbTimeline) ---
	rgb_timeline_get_rtti :: proc(self: RgbTimeline) -> Rtti ---
	rgb_timeline_set_frame :: proc(self: RgbTimeline, frame: c.int, time: c.float, r: c.float, g: c.float, b: c.float) ---
	rgb_timeline_apply :: proc(self: RgbTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	rgb_timeline_get_slot_index :: proc(self: RgbTimeline) -> c.int ---
	rgb_timeline_set_slot_index :: proc(self: RgbTimeline, in_value: c.int) ---
	rgb_timeline_set_linear :: proc(self: RgbTimeline, frame: c.size_t) ---
	rgb_timeline_set_stepped :: proc(self: RgbTimeline, frame: c.size_t) ---
	rgb_timeline_set_bezier :: proc(self: RgbTimeline, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	rgb_timeline_get_bezier_value :: proc(self: RgbTimeline, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	rgb_timeline_get_curves :: proc(self: RgbTimeline) -> ArrayFloat ---
	rgb_timeline_get_additive :: proc(self: RgbTimeline) -> c.bool ---
	rgb_timeline_get_instant :: proc(self: RgbTimeline) -> c.bool ---
	rgb_timeline_get_frame_entries :: proc(self: RgbTimeline) -> c.size_t ---
	rgb_timeline_get_frame_count :: proc(self: RgbTimeline) -> c.size_t ---
	rgb_timeline_get_frames :: proc(self: RgbTimeline) -> ArrayFloat ---
	rgb_timeline_get_duration :: proc(self: RgbTimeline) -> c.float ---
	rgb_timeline_get_property_ids :: proc(self: RgbTimeline) -> ArrayPropertyId ---
	rgb_timeline_rtti :: proc() -> Rtti ---
	rgba2_timeline_create :: proc(frame_count: c.size_t, bezier_count: c.size_t, slot_index: c.int) -> Rgba2Timeline ---
	rgba2_timeline_dispose :: proc(self: Rgba2Timeline) ---
	rgba2_timeline_get_rtti :: proc(self: Rgba2Timeline) -> Rtti ---
	rgba2_timeline_set_frame :: proc(self: Rgba2Timeline, frame: c.int, time: c.float, r: c.float, g: c.float, b: c.float, a: c.float, r2: c.float, g2: c.float, b2: c.float) ---
	rgba2_timeline_apply :: proc(self: Rgba2Timeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	rgba2_timeline_get_slot_index :: proc(self: Rgba2Timeline) -> c.int ---
	rgba2_timeline_set_slot_index :: proc(self: Rgba2Timeline, in_value: c.int) ---
	rgba2_timeline_set_linear :: proc(self: Rgba2Timeline, frame: c.size_t) ---
	rgba2_timeline_set_stepped :: proc(self: Rgba2Timeline, frame: c.size_t) ---
	rgba2_timeline_set_bezier :: proc(self: Rgba2Timeline, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	rgba2_timeline_get_bezier_value :: proc(self: Rgba2Timeline, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	rgba2_timeline_get_curves :: proc(self: Rgba2Timeline) -> ArrayFloat ---
	rgba2_timeline_get_additive :: proc(self: Rgba2Timeline) -> c.bool ---
	rgba2_timeline_get_instant :: proc(self: Rgba2Timeline) -> c.bool ---
	rgba2_timeline_get_frame_entries :: proc(self: Rgba2Timeline) -> c.size_t ---
	rgba2_timeline_get_frame_count :: proc(self: Rgba2Timeline) -> c.size_t ---
	rgba2_timeline_get_frames :: proc(self: Rgba2Timeline) -> ArrayFloat ---
	rgba2_timeline_get_duration :: proc(self: Rgba2Timeline) -> c.float ---
	rgba2_timeline_get_property_ids :: proc(self: Rgba2Timeline) -> ArrayPropertyId ---
	rgba2_timeline_rtti :: proc() -> Rtti ---
	rgba_timeline_create :: proc(frame_count: c.size_t, bezier_count: c.size_t, slot_index: c.int) -> RgbaTimeline ---
	rgba_timeline_dispose :: proc(self: RgbaTimeline) ---
	rgba_timeline_get_rtti :: proc(self: RgbaTimeline) -> Rtti ---
	rgba_timeline_set_frame :: proc(self: RgbaTimeline, frame: c.int, time: c.float, r: c.float, g: c.float, b: c.float, a: c.float) ---
	rgba_timeline_apply :: proc(self: RgbaTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	rgba_timeline_get_slot_index :: proc(self: RgbaTimeline) -> c.int ---
	rgba_timeline_set_slot_index :: proc(self: RgbaTimeline, in_value: c.int) ---
	rgba_timeline_set_linear :: proc(self: RgbaTimeline, frame: c.size_t) ---
	rgba_timeline_set_stepped :: proc(self: RgbaTimeline, frame: c.size_t) ---
	rgba_timeline_set_bezier :: proc(self: RgbaTimeline, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	rgba_timeline_get_bezier_value :: proc(self: RgbaTimeline, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	rgba_timeline_get_curves :: proc(self: RgbaTimeline) -> ArrayFloat ---
	rgba_timeline_get_additive :: proc(self: RgbaTimeline) -> c.bool ---
	rgba_timeline_get_instant :: proc(self: RgbaTimeline) -> c.bool ---
	rgba_timeline_get_frame_entries :: proc(self: RgbaTimeline) -> c.size_t ---
	rgba_timeline_get_frame_count :: proc(self: RgbaTimeline) -> c.size_t ---
	rgba_timeline_get_frames :: proc(self: RgbaTimeline) -> ArrayFloat ---
	rgba_timeline_get_duration :: proc(self: RgbaTimeline) -> c.float ---
	rgba_timeline_get_property_ids :: proc(self: RgbaTimeline) -> ArrayPropertyId ---
	rgba_timeline_rtti :: proc() -> Rtti ---
	rotate_timeline_create :: proc(frame_count: c.size_t, bezier_count: c.size_t, bone_index: c.int) -> RotateTimeline ---
	rotate_timeline_dispose :: proc(self: RotateTimeline) ---
	rotate_timeline_get_rtti :: proc(self: RotateTimeline) -> Rtti ---
	rotate_timeline_apply :: proc(self: RotateTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	rotate_timeline_get_bone_index :: proc(self: RotateTimeline) -> c.int ---
	rotate_timeline_set_bone_index :: proc(self: RotateTimeline, in_value: c.int) ---
	rotate_timeline_set_frame :: proc(self: RotateTimeline, frame: c.size_t, time: c.float, value: c.float) ---
	rotate_timeline_get_curve_value :: proc(self: RotateTimeline, time: c.float) -> c.float ---
	rotate_timeline_get_relative_value :: proc(self: RotateTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	rotate_timeline_get_absolute_value_1 :: proc(self: RotateTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	rotate_timeline_get_absolute_value_2 :: proc(self: RotateTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float, value: c.float) -> c.float ---
	rotate_timeline_get_scale_value :: proc(self: RotateTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, current: c.float, setup: c.float) -> c.float ---
	rotate_timeline_set_linear :: proc(self: RotateTimeline, frame: c.size_t) ---
	rotate_timeline_set_stepped :: proc(self: RotateTimeline, frame: c.size_t) ---
	rotate_timeline_set_bezier :: proc(self: RotateTimeline, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	rotate_timeline_get_bezier_value :: proc(self: RotateTimeline, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	rotate_timeline_get_curves :: proc(self: RotateTimeline) -> ArrayFloat ---
	rotate_timeline_get_additive :: proc(self: RotateTimeline) -> c.bool ---
	rotate_timeline_get_instant :: proc(self: RotateTimeline) -> c.bool ---
	rotate_timeline_get_frame_entries :: proc(self: RotateTimeline) -> c.size_t ---
	rotate_timeline_get_frame_count :: proc(self: RotateTimeline) -> c.size_t ---
	rotate_timeline_get_frames :: proc(self: RotateTimeline) -> ArrayFloat ---
	rotate_timeline_get_duration :: proc(self: RotateTimeline) -> c.float ---
	rotate_timeline_get_property_ids :: proc(self: RotateTimeline) -> ArrayPropertyId ---
	rotate_timeline_rtti :: proc() -> Rtti ---
	rtti_dispose :: proc(self: Rtti) ---
	rtti_get_class_name :: proc(self: Rtti) -> cstring ---
	rtti_is_exactly :: proc(self: Rtti, rtti: Rtti) -> c.bool ---
	rtti_instance_of :: proc(self: Rtti, rtti: Rtti) -> c.bool ---
	scale_timeline_create :: proc(frame_count: c.size_t, bezier_count: c.size_t, bone_index: c.int) -> ScaleTimeline ---
	scale_timeline_dispose :: proc(self: ScaleTimeline) ---
	scale_timeline_get_rtti :: proc(self: ScaleTimeline) -> Rtti ---
	scale_timeline_apply :: proc(self: ScaleTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	scale_timeline_get_bone_index :: proc(self: ScaleTimeline) -> c.int ---
	scale_timeline_set_bone_index :: proc(self: ScaleTimeline, in_value: c.int) ---
	scale_timeline_set_frame :: proc(self: ScaleTimeline, frame: c.size_t, time: c.float, value1: c.float, value2: c.float) ---
	scale_timeline_set_linear :: proc(self: ScaleTimeline, frame: c.size_t) ---
	scale_timeline_set_stepped :: proc(self: ScaleTimeline, frame: c.size_t) ---
	scale_timeline_set_bezier :: proc(self: ScaleTimeline, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	scale_timeline_get_bezier_value :: proc(self: ScaleTimeline, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	scale_timeline_get_curves :: proc(self: ScaleTimeline) -> ArrayFloat ---
	scale_timeline_get_additive :: proc(self: ScaleTimeline) -> c.bool ---
	scale_timeline_get_instant :: proc(self: ScaleTimeline) -> c.bool ---
	scale_timeline_get_frame_entries :: proc(self: ScaleTimeline) -> c.size_t ---
	scale_timeline_get_frame_count :: proc(self: ScaleTimeline) -> c.size_t ---
	scale_timeline_get_frames :: proc(self: ScaleTimeline) -> ArrayFloat ---
	scale_timeline_get_duration :: proc(self: ScaleTimeline) -> c.float ---
	scale_timeline_get_property_ids :: proc(self: ScaleTimeline) -> ArrayPropertyId ---
	scale_timeline_rtti :: proc() -> Rtti ---
	scale_x_timeline_create :: proc(frame_count: c.size_t, bezier_count: c.size_t, bone_index: c.int) -> ScaleXTimeline ---
	scale_x_timeline_dispose :: proc(self: ScaleXTimeline) ---
	scale_x_timeline_get_rtti :: proc(self: ScaleXTimeline) -> Rtti ---
	scale_x_timeline_apply :: proc(self: ScaleXTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	scale_x_timeline_get_bone_index :: proc(self: ScaleXTimeline) -> c.int ---
	scale_x_timeline_set_bone_index :: proc(self: ScaleXTimeline, in_value: c.int) ---
	scale_x_timeline_set_frame :: proc(self: ScaleXTimeline, frame: c.size_t, time: c.float, value: c.float) ---
	scale_x_timeline_get_curve_value :: proc(self: ScaleXTimeline, time: c.float) -> c.float ---
	scale_x_timeline_get_relative_value :: proc(self: ScaleXTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	scale_x_timeline_get_absolute_value_1 :: proc(self: ScaleXTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	scale_x_timeline_get_absolute_value_2 :: proc(self: ScaleXTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float, value: c.float) -> c.float ---
	scale_x_timeline_get_scale_value :: proc(self: ScaleXTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, current: c.float, setup: c.float) -> c.float ---
	scale_x_timeline_set_linear :: proc(self: ScaleXTimeline, frame: c.size_t) ---
	scale_x_timeline_set_stepped :: proc(self: ScaleXTimeline, frame: c.size_t) ---
	scale_x_timeline_set_bezier :: proc(self: ScaleXTimeline, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	scale_x_timeline_get_bezier_value :: proc(self: ScaleXTimeline, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	scale_x_timeline_get_curves :: proc(self: ScaleXTimeline) -> ArrayFloat ---
	scale_x_timeline_get_additive :: proc(self: ScaleXTimeline) -> c.bool ---
	scale_x_timeline_get_instant :: proc(self: ScaleXTimeline) -> c.bool ---
	scale_x_timeline_get_frame_entries :: proc(self: ScaleXTimeline) -> c.size_t ---
	scale_x_timeline_get_frame_count :: proc(self: ScaleXTimeline) -> c.size_t ---
	scale_x_timeline_get_frames :: proc(self: ScaleXTimeline) -> ArrayFloat ---
	scale_x_timeline_get_duration :: proc(self: ScaleXTimeline) -> c.float ---
	scale_x_timeline_get_property_ids :: proc(self: ScaleXTimeline) -> ArrayPropertyId ---
	scale_x_timeline_rtti :: proc() -> Rtti ---
	scale_y_timeline_create :: proc(frame_count: c.size_t, bezier_count: c.size_t, bone_index: c.int) -> ScaleYTimeline ---
	scale_y_timeline_dispose :: proc(self: ScaleYTimeline) ---
	scale_y_timeline_get_rtti :: proc(self: ScaleYTimeline) -> Rtti ---
	scale_y_timeline_apply :: proc(self: ScaleYTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	scale_y_timeline_get_bone_index :: proc(self: ScaleYTimeline) -> c.int ---
	scale_y_timeline_set_bone_index :: proc(self: ScaleYTimeline, in_value: c.int) ---
	scale_y_timeline_set_frame :: proc(self: ScaleYTimeline, frame: c.size_t, time: c.float, value: c.float) ---
	scale_y_timeline_get_curve_value :: proc(self: ScaleYTimeline, time: c.float) -> c.float ---
	scale_y_timeline_get_relative_value :: proc(self: ScaleYTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	scale_y_timeline_get_absolute_value_1 :: proc(self: ScaleYTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	scale_y_timeline_get_absolute_value_2 :: proc(self: ScaleYTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float, value: c.float) -> c.float ---
	scale_y_timeline_get_scale_value :: proc(self: ScaleYTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, current: c.float, setup: c.float) -> c.float ---
	scale_y_timeline_set_linear :: proc(self: ScaleYTimeline, frame: c.size_t) ---
	scale_y_timeline_set_stepped :: proc(self: ScaleYTimeline, frame: c.size_t) ---
	scale_y_timeline_set_bezier :: proc(self: ScaleYTimeline, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	scale_y_timeline_get_bezier_value :: proc(self: ScaleYTimeline, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	scale_y_timeline_get_curves :: proc(self: ScaleYTimeline) -> ArrayFloat ---
	scale_y_timeline_get_additive :: proc(self: ScaleYTimeline) -> c.bool ---
	scale_y_timeline_get_instant :: proc(self: ScaleYTimeline) -> c.bool ---
	scale_y_timeline_get_frame_entries :: proc(self: ScaleYTimeline) -> c.size_t ---
	scale_y_timeline_get_frame_count :: proc(self: ScaleYTimeline) -> c.size_t ---
	scale_y_timeline_get_frames :: proc(self: ScaleYTimeline) -> ArrayFloat ---
	scale_y_timeline_get_duration :: proc(self: ScaleYTimeline) -> c.float ---
	scale_y_timeline_get_property_ids :: proc(self: ScaleYTimeline) -> ArrayPropertyId ---
	scale_y_timeline_rtti :: proc() -> Rtti ---
	sequence_create :: proc(count: c.int, path_suffix: c.bool) -> Sequence ---
	sequence_create2 :: proc(other: Sequence) -> Sequence ---
	sequence_dispose :: proc(self: Sequence) ---
	sequence_update_1 :: proc(self: Sequence, attachment: RegionAttachment) ---
	sequence_update_2 :: proc(self: Sequence, attachment: MeshAttachment) ---
	sequence_get_regions :: proc(self: Sequence) -> ArrayTextureRegion ---
	sequence_resolve_index :: proc(self: Sequence, pose: SlotPose) -> c.int ---
	sequence_get_region :: proc(self: Sequence, index: c.int) -> TextureRegion ---
	sequence_get_u_vs :: proc(self: Sequence, index: c.int) -> ArrayFloat ---
	sequence_get_offsets :: proc(self: Sequence, index: c.int) -> ArrayFloat ---
	sequence_get_start :: proc(self: Sequence) -> c.int ---
	sequence_set_start :: proc(self: Sequence, start: c.int) ---
	sequence_get_digits :: proc(self: Sequence) -> c.int ---
	sequence_set_digits :: proc(self: Sequence, digits: c.int) ---
	sequence_get_setup_index :: proc(self: Sequence) -> c.int ---
	sequence_set_setup_index :: proc(self: Sequence, setup_index: c.int) ---
	sequence_has_path_suffix :: proc(self: Sequence) -> c.bool ---
	sequence_get_path :: proc(self: Sequence, base_path: cstring, index: c.int) -> cstring ---
	sequence_get_id :: proc(self: Sequence) -> c.int ---
	sequence_timeline_create :: proc(frame_count: c.size_t, slot_index: c.int, attachment: Attachment) -> SequenceTimeline ---
	sequence_timeline_dispose :: proc(self: SequenceTimeline) ---
	sequence_timeline_get_rtti :: proc(self: SequenceTimeline) -> Rtti ---
	sequence_timeline_apply :: proc(self: SequenceTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	sequence_timeline_set_frame :: proc(self: SequenceTimeline, frame: c.int, time: c.float, mode: SequenceMode, index: c.int, delay: c.float) ---
	sequence_timeline_get_attachment :: proc(self: SequenceTimeline) -> Attachment ---
	sequence_timeline_get_slot_index :: proc(self: SequenceTimeline) -> c.int ---
	sequence_timeline_set_slot_index :: proc(self: SequenceTimeline, in_value: c.int) ---
	sequence_timeline_get_additive :: proc(self: SequenceTimeline) -> c.bool ---
	sequence_timeline_get_instant :: proc(self: SequenceTimeline) -> c.bool ---
	sequence_timeline_get_frame_entries :: proc(self: SequenceTimeline) -> c.size_t ---
	sequence_timeline_get_frame_count :: proc(self: SequenceTimeline) -> c.size_t ---
	sequence_timeline_get_frames :: proc(self: SequenceTimeline) -> ArrayFloat ---
	sequence_timeline_get_duration :: proc(self: SequenceTimeline) -> c.float ---
	sequence_timeline_get_property_ids :: proc(self: SequenceTimeline) -> ArrayPropertyId ---
	sequence_timeline_rtti :: proc() -> Rtti ---
	shear_timeline_create :: proc(frame_count: c.size_t, bezier_count: c.size_t, bone_index: c.int) -> ShearTimeline ---
	shear_timeline_dispose :: proc(self: ShearTimeline) ---
	shear_timeline_get_rtti :: proc(self: ShearTimeline) -> Rtti ---
	shear_timeline_apply :: proc(self: ShearTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	shear_timeline_get_bone_index :: proc(self: ShearTimeline) -> c.int ---
	shear_timeline_set_bone_index :: proc(self: ShearTimeline, in_value: c.int) ---
	shear_timeline_set_frame :: proc(self: ShearTimeline, frame: c.size_t, time: c.float, value1: c.float, value2: c.float) ---
	shear_timeline_set_linear :: proc(self: ShearTimeline, frame: c.size_t) ---
	shear_timeline_set_stepped :: proc(self: ShearTimeline, frame: c.size_t) ---
	shear_timeline_set_bezier :: proc(self: ShearTimeline, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	shear_timeline_get_bezier_value :: proc(self: ShearTimeline, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	shear_timeline_get_curves :: proc(self: ShearTimeline) -> ArrayFloat ---
	shear_timeline_get_additive :: proc(self: ShearTimeline) -> c.bool ---
	shear_timeline_get_instant :: proc(self: ShearTimeline) -> c.bool ---
	shear_timeline_get_frame_entries :: proc(self: ShearTimeline) -> c.size_t ---
	shear_timeline_get_frame_count :: proc(self: ShearTimeline) -> c.size_t ---
	shear_timeline_get_frames :: proc(self: ShearTimeline) -> ArrayFloat ---
	shear_timeline_get_duration :: proc(self: ShearTimeline) -> c.float ---
	shear_timeline_get_property_ids :: proc(self: ShearTimeline) -> ArrayPropertyId ---
	shear_timeline_rtti :: proc() -> Rtti ---
	shear_x_timeline_create :: proc(frame_count: c.size_t, bezier_count: c.size_t, bone_index: c.int) -> ShearXTimeline ---
	shear_x_timeline_dispose :: proc(self: ShearXTimeline) ---
	shear_x_timeline_get_rtti :: proc(self: ShearXTimeline) -> Rtti ---
	shear_x_timeline_apply :: proc(self: ShearXTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	shear_x_timeline_get_bone_index :: proc(self: ShearXTimeline) -> c.int ---
	shear_x_timeline_set_bone_index :: proc(self: ShearXTimeline, in_value: c.int) ---
	shear_x_timeline_set_frame :: proc(self: ShearXTimeline, frame: c.size_t, time: c.float, value: c.float) ---
	shear_x_timeline_get_curve_value :: proc(self: ShearXTimeline, time: c.float) -> c.float ---
	shear_x_timeline_get_relative_value :: proc(self: ShearXTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	shear_x_timeline_get_absolute_value_1 :: proc(self: ShearXTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	shear_x_timeline_get_absolute_value_2 :: proc(self: ShearXTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float, value: c.float) -> c.float ---
	shear_x_timeline_get_scale_value :: proc(self: ShearXTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, current: c.float, setup: c.float) -> c.float ---
	shear_x_timeline_set_linear :: proc(self: ShearXTimeline, frame: c.size_t) ---
	shear_x_timeline_set_stepped :: proc(self: ShearXTimeline, frame: c.size_t) ---
	shear_x_timeline_set_bezier :: proc(self: ShearXTimeline, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	shear_x_timeline_get_bezier_value :: proc(self: ShearXTimeline, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	shear_x_timeline_get_curves :: proc(self: ShearXTimeline) -> ArrayFloat ---
	shear_x_timeline_get_additive :: proc(self: ShearXTimeline) -> c.bool ---
	shear_x_timeline_get_instant :: proc(self: ShearXTimeline) -> c.bool ---
	shear_x_timeline_get_frame_entries :: proc(self: ShearXTimeline) -> c.size_t ---
	shear_x_timeline_get_frame_count :: proc(self: ShearXTimeline) -> c.size_t ---
	shear_x_timeline_get_frames :: proc(self: ShearXTimeline) -> ArrayFloat ---
	shear_x_timeline_get_duration :: proc(self: ShearXTimeline) -> c.float ---
	shear_x_timeline_get_property_ids :: proc(self: ShearXTimeline) -> ArrayPropertyId ---
	shear_x_timeline_rtti :: proc() -> Rtti ---
	shear_y_timeline_create :: proc(frame_count: c.size_t, bezier_count: c.size_t, bone_index: c.int) -> ShearYTimeline ---
	shear_y_timeline_dispose :: proc(self: ShearYTimeline) ---
	shear_y_timeline_get_rtti :: proc(self: ShearYTimeline) -> Rtti ---
	shear_y_timeline_apply :: proc(self: ShearYTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	shear_y_timeline_get_bone_index :: proc(self: ShearYTimeline) -> c.int ---
	shear_y_timeline_set_bone_index :: proc(self: ShearYTimeline, in_value: c.int) ---
	shear_y_timeline_set_frame :: proc(self: ShearYTimeline, frame: c.size_t, time: c.float, value: c.float) ---
	shear_y_timeline_get_curve_value :: proc(self: ShearYTimeline, time: c.float) -> c.float ---
	shear_y_timeline_get_relative_value :: proc(self: ShearYTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	shear_y_timeline_get_absolute_value_1 :: proc(self: ShearYTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	shear_y_timeline_get_absolute_value_2 :: proc(self: ShearYTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float, value: c.float) -> c.float ---
	shear_y_timeline_get_scale_value :: proc(self: ShearYTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, current: c.float, setup: c.float) -> c.float ---
	shear_y_timeline_set_linear :: proc(self: ShearYTimeline, frame: c.size_t) ---
	shear_y_timeline_set_stepped :: proc(self: ShearYTimeline, frame: c.size_t) ---
	shear_y_timeline_set_bezier :: proc(self: ShearYTimeline, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	shear_y_timeline_get_bezier_value :: proc(self: ShearYTimeline, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	shear_y_timeline_get_curves :: proc(self: ShearYTimeline) -> ArrayFloat ---
	shear_y_timeline_get_additive :: proc(self: ShearYTimeline) -> c.bool ---
	shear_y_timeline_get_instant :: proc(self: ShearYTimeline) -> c.bool ---
	shear_y_timeline_get_frame_entries :: proc(self: ShearYTimeline) -> c.size_t ---
	shear_y_timeline_get_frame_count :: proc(self: ShearYTimeline) -> c.size_t ---
	shear_y_timeline_get_frames :: proc(self: ShearYTimeline) -> ArrayFloat ---
	shear_y_timeline_get_duration :: proc(self: ShearYTimeline) -> c.float ---
	shear_y_timeline_get_property_ids :: proc(self: ShearYTimeline) -> ArrayPropertyId ---
	shear_y_timeline_rtti :: proc() -> Rtti ---
	skeleton_create :: proc(skeleton_data: SkeletonData) -> Skeleton ---
	skeleton_dispose :: proc(self: Skeleton) ---
	skeleton_update_cache :: proc(self: Skeleton) ---
	skeleton_print_update_cache :: proc(self: Skeleton) ---
	skeleton_constrained :: proc(self: Skeleton, object: Posed) ---
	skeleton_sort_bone :: proc(self: Skeleton, bone: Bone) ---
	skeleton_sort_reset :: proc(bones: ArrayBone) ---
	skeleton_update_world_transform :: proc(self: Skeleton, physics: Physics) ---
	skeleton_setup_pose :: proc(self: Skeleton) ---
	skeleton_setup_pose_bones :: proc(self: Skeleton) ---
	skeleton_setup_pose_slots :: proc(self: Skeleton) ---
	skeleton_get_data :: proc(self: Skeleton) -> SkeletonData ---
	skeleton_get_bones :: proc(self: Skeleton) -> ArrayBone ---
	skeleton_get_update_cache :: proc(self: Skeleton) -> ArrayUpdate ---
	skeleton_get_root_bone :: proc(self: Skeleton) -> Bone ---
	skeleton_find_bone :: proc(self: Skeleton, bone_name: cstring) -> Bone ---
	skeleton_get_slots :: proc(self: Skeleton) -> ArraySlot ---
	skeleton_find_slot :: proc(self: Skeleton, slot_name: cstring) -> Slot ---
	skeleton_get_draw_order :: proc(self: Skeleton) -> DrawOrder ---
	skeleton_get_skin :: proc(self: Skeleton) -> Skin ---
	skeleton_set_skin_1 :: proc(self: Skeleton, skin_name: cstring) ---
	skeleton_set_skin_2 :: proc(self: Skeleton, new_skin: Skin) ---
	skeleton_get_attachment_1 :: proc(self: Skeleton, slot_name: cstring, placeholder_name: cstring) -> Attachment ---
	skeleton_get_attachment_2 :: proc(self: Skeleton, slot_index: c.int, placeholder_name: cstring) -> Attachment ---
	skeleton_set_attachment :: proc(self: Skeleton, slot_name: cstring, placeholder_name: cstring) ---
	skeleton_get_constraints :: proc(self: Skeleton) -> ArrayConstraint ---
	skeleton_get_physics_constraints :: proc(self: Skeleton) -> ArrayPhysicsConstraint ---
	skeleton_get_bounds_1 :: proc(self: Skeleton, out_x: [^]c.float, out_y: [^]c.float, out_width: [^]c.float, out_height: [^]c.float) ---
	skeleton_get_bounds_2 :: proc(self: Skeleton, out_x: [^]c.float, out_y: [^]c.float, out_width: [^]c.float, out_height: [^]c.float, out_vertex_buffer: ArrayFloat, clipping: SkeletonClipping) ---
	skeleton_get_color :: proc(self: Skeleton) -> Color ---
	skeleton_set_color_1 :: proc(self: Skeleton, color: Color) ---
	skeleton_set_color_2 :: proc(self: Skeleton, r: c.float, g: c.float, b: c.float, a: c.float) ---
	skeleton_get_scale_x :: proc(self: Skeleton) -> c.float ---
	skeleton_set_scale_x :: proc(self: Skeleton, in_value: c.float) ---
	skeleton_get_scale_y :: proc(self: Skeleton) -> c.float ---
	skeleton_set_scale_y :: proc(self: Skeleton, in_value: c.float) ---
	skeleton_set_scale :: proc(self: Skeleton, scale_x: c.float, scale_y: c.float) ---
	skeleton_get_x :: proc(self: Skeleton) -> c.float ---
	skeleton_set_x :: proc(self: Skeleton, in_value: c.float) ---
	skeleton_get_y :: proc(self: Skeleton) -> c.float ---
	skeleton_set_y :: proc(self: Skeleton, in_value: c.float) ---
	skeleton_set_position :: proc(self: Skeleton, x: c.float, y: c.float) ---
	skeleton_get_position :: proc(self: Skeleton, x: [^]c.float, y: [^]c.float) ---
	skeleton_get_wind_x :: proc(self: Skeleton) -> c.float ---
	skeleton_set_wind_x :: proc(self: Skeleton, wind_x: c.float) ---
	skeleton_get_wind_y :: proc(self: Skeleton) -> c.float ---
	skeleton_set_wind_y :: proc(self: Skeleton, wind_y: c.float) ---
	skeleton_get_gravity_x :: proc(self: Skeleton) -> c.float ---
	skeleton_set_gravity_x :: proc(self: Skeleton, gravity_x: c.float) ---
	skeleton_get_gravity_y :: proc(self: Skeleton) -> c.float ---
	skeleton_set_gravity_y :: proc(self: Skeleton, gravity_y: c.float) ---
	skeleton_physics_translate :: proc(self: Skeleton, x: c.float, y: c.float) ---
	skeleton_physics_rotate :: proc(self: Skeleton, x: c.float, y: c.float, degrees: c.float) ---
	skeleton_get_time :: proc(self: Skeleton) -> c.float ---
	skeleton_set_time :: proc(self: Skeleton, time: c.float) ---
	skeleton_update :: proc(self: Skeleton, delta: c.float) ---
	skeleton_binary_create :: proc(atlas: Atlas) -> SkeletonBinary ---
	skeleton_binary_create2 :: proc(attachment_loader: AttachmentLoader, owns_loader: c.bool) -> SkeletonBinary ---
	skeleton_binary_dispose :: proc(self: SkeletonBinary) ---
	skeleton_binary_read_skeleton_data :: proc(self: SkeletonBinary, binary: [^]c.uchar, length: c.int) -> SkeletonData ---
	skeleton_binary_read_skeleton_data_file :: proc(self: SkeletonBinary, path: cstring) -> SkeletonData ---
	skeleton_binary_set_scale :: proc(self: SkeletonBinary, scale: c.float) ---
	skeleton_binary_get_error :: proc(self: SkeletonBinary) -> cstring ---
	skeleton_bounds_create :: proc() -> SkeletonBounds ---
	skeleton_bounds_dispose :: proc(self: SkeletonBounds) ---
	skeleton_bounds_update :: proc(self: SkeletonBounds, skeleton: Skeleton, update_aabb: c.bool) ---
	skeleton_bounds_aabb_contains_point :: proc(self: SkeletonBounds, x: c.float, y: c.float) -> c.bool ---
	skeleton_bounds_aabb_intersects_segment :: proc(self: SkeletonBounds, x1: c.float, y1: c.float, x2: c.float, y2: c.float) -> c.bool ---
	skeleton_bounds_aabb_intersects_skeleton :: proc(self: SkeletonBounds, bounds: SkeletonBounds) -> c.bool ---
	skeleton_bounds_contains_point_1 :: proc(self: SkeletonBounds, polygon: Polygon, x: c.float, y: c.float) -> c.bool ---
	skeleton_bounds_contains_point_2 :: proc(self: SkeletonBounds, x: c.float, y: c.float) -> BoundingBoxAttachment ---
	skeleton_bounds_intersects_segment_1 :: proc(self: SkeletonBounds, x1: c.float, y1: c.float, x2: c.float, y2: c.float) -> BoundingBoxAttachment ---
	skeleton_bounds_intersects_segment_2 :: proc(self: SkeletonBounds, polygon: Polygon, x1: c.float, y1: c.float, x2: c.float, y2: c.float) -> c.bool ---
	skeleton_bounds_get_polygon :: proc(self: SkeletonBounds, attachment: BoundingBoxAttachment) -> Polygon ---
	skeleton_bounds_get_bounding_box :: proc(self: SkeletonBounds, polygon: Polygon) -> BoundingBoxAttachment ---
	skeleton_bounds_get_polygons :: proc(self: SkeletonBounds) -> ArrayPolygon ---
	skeleton_bounds_get_bounding_boxes :: proc(self: SkeletonBounds) -> ArrayBoundingBoxAttachment ---
	skeleton_bounds_get_min_x :: proc(self: SkeletonBounds) -> c.float ---
	skeleton_bounds_get_min_y :: proc(self: SkeletonBounds) -> c.float ---
	skeleton_bounds_get_max_x :: proc(self: SkeletonBounds) -> c.float ---
	skeleton_bounds_get_max_y :: proc(self: SkeletonBounds) -> c.float ---
	skeleton_bounds_get_width :: proc(self: SkeletonBounds) -> c.float ---
	skeleton_bounds_get_height :: proc(self: SkeletonBounds) -> c.float ---
	skeleton_clipping_create :: proc() -> SkeletonClipping ---
	skeleton_clipping_dispose :: proc(self: SkeletonClipping) ---
	skeleton_clipping_clip_start :: proc(self: SkeletonClipping, skeleton: Skeleton, slot: Slot, clip: ClippingAttachment) -> c.size_t ---
	skeleton_clipping_clip_end_1 :: proc(self: SkeletonClipping, slot: Slot) ---
	skeleton_clipping_clip_end_2 :: proc(self: SkeletonClipping) ---
	skeleton_clipping_clip_triangles_1 :: proc(self: SkeletonClipping, vertices: [^]c.float, triangles: [^]c.ushort, triangles_length: c.size_t) -> c.bool ---
	skeleton_clipping_clip_triangles_2 :: proc(self: SkeletonClipping, vertices: [^]c.float, triangles: [^]c.ushort, triangles_length: c.size_t, uvs: [^]c.float, stride: c.size_t) -> c.bool ---
	skeleton_clipping_clip_triangles_3 :: proc(self: SkeletonClipping, vertices: ArrayFloat, triangles: ArrayUnsignedShort, uvs: ArrayFloat, stride: c.size_t) -> c.bool ---
	skeleton_clipping_is_clipping :: proc(self: SkeletonClipping) -> c.bool ---
	skeleton_clipping_get_clipped_vertices :: proc(self: SkeletonClipping) -> ArrayFloat ---
	skeleton_clipping_get_clipped_triangles :: proc(self: SkeletonClipping) -> ArrayUnsignedShort ---
	skeleton_clipping_get_clipped_u_vs :: proc(self: SkeletonClipping) -> ArrayFloat ---
	skeleton_data_create :: proc() -> SkeletonData ---
	skeleton_data_dispose :: proc(self: SkeletonData) ---
	skeleton_data_find_bone :: proc(self: SkeletonData, bone_name: cstring) -> BoneData ---
	skeleton_data_find_slot :: proc(self: SkeletonData, slot_name: cstring) -> SlotData ---
	skeleton_data_find_skin :: proc(self: SkeletonData, skin_name: cstring) -> Skin ---
	skeleton_data_find_event :: proc(self: SkeletonData, event_data_name: cstring) -> EventData ---
	skeleton_data_find_animation :: proc(self: SkeletonData, animation_name: cstring) -> Animation ---
	skeleton_data_find_slider_animations :: proc(self: SkeletonData, animations: ArrayAnimation) -> ArrayAnimation ---
	skeleton_data_get_name :: proc(self: SkeletonData) -> cstring ---
	skeleton_data_set_name :: proc(self: SkeletonData, in_value: cstring) ---
	skeleton_data_get_bones :: proc(self: SkeletonData) -> ArrayBoneData ---
	skeleton_data_get_slots :: proc(self: SkeletonData) -> ArraySlotData ---
	skeleton_data_get_skins :: proc(self: SkeletonData) -> ArraySkin ---
	skeleton_data_get_default_skin :: proc(self: SkeletonData) -> Skin ---
	skeleton_data_set_default_skin :: proc(self: SkeletonData, in_value: Skin) ---
	skeleton_data_get_events :: proc(self: SkeletonData) -> ArrayEventData ---
	skeleton_data_get_animations :: proc(self: SkeletonData) -> ArrayAnimation ---
	skeleton_data_get_constraints :: proc(self: SkeletonData) -> ArrayConstraintData ---
	skeleton_data_get_x :: proc(self: SkeletonData) -> c.float ---
	skeleton_data_set_x :: proc(self: SkeletonData, in_value: c.float) ---
	skeleton_data_get_y :: proc(self: SkeletonData) -> c.float ---
	skeleton_data_set_y :: proc(self: SkeletonData, in_value: c.float) ---
	skeleton_data_get_width :: proc(self: SkeletonData) -> c.float ---
	skeleton_data_set_width :: proc(self: SkeletonData, in_value: c.float) ---
	skeleton_data_get_height :: proc(self: SkeletonData) -> c.float ---
	skeleton_data_set_height :: proc(self: SkeletonData, in_value: c.float) ---
	skeleton_data_get_reference_scale :: proc(self: SkeletonData) -> c.float ---
	skeleton_data_set_reference_scale :: proc(self: SkeletonData, in_value: c.float) ---
	skeleton_data_get_version :: proc(self: SkeletonData) -> cstring ---
	skeleton_data_set_version :: proc(self: SkeletonData, in_value: cstring) ---
	skeleton_data_get_hash :: proc(self: SkeletonData) -> cstring ---
	skeleton_data_set_hash :: proc(self: SkeletonData, in_value: cstring) ---
	skeleton_data_get_images_path :: proc(self: SkeletonData) -> cstring ---
	skeleton_data_set_images_path :: proc(self: SkeletonData, in_value: cstring) ---
	skeleton_data_get_audio_path :: proc(self: SkeletonData) -> cstring ---
	skeleton_data_set_audio_path :: proc(self: SkeletonData, in_value: cstring) ---
	skeleton_data_get_fps :: proc(self: SkeletonData) -> c.float ---
	skeleton_data_set_fps :: proc(self: SkeletonData, in_value: c.float) ---
	skeleton_json_create :: proc(atlas: Atlas) -> SkeletonJson ---
	skeleton_json_create2 :: proc(attachment_loader: AttachmentLoader, owns_loader: c.bool) -> SkeletonJson ---
	skeleton_json_dispose :: proc(self: SkeletonJson) ---
	skeleton_json_read_skeleton_data_file :: proc(self: SkeletonJson, path: cstring) -> SkeletonData ---
	skeleton_json_read_skeleton_data :: proc(self: SkeletonJson, json: cstring) -> SkeletonData ---
	skeleton_json_set_scale :: proc(self: SkeletonJson, scale: c.float) ---
	skeleton_json_get_error :: proc(self: SkeletonJson) -> cstring ---
	skeleton_renderer_create :: proc() -> SkeletonRenderer ---
	skeleton_renderer_dispose :: proc(self: SkeletonRenderer) ---
	skeleton_renderer_render :: proc(self: SkeletonRenderer, skeleton: Skeleton) -> RenderCommand ---
	skin_create :: proc(name: cstring) -> Skin ---
	skin_dispose :: proc(self: Skin) ---
	skin_set_attachment :: proc(self: Skin, slot_index: c.size_t, placeholder_name: cstring, attachment: Attachment) ---
	skin_get_attachment :: proc(self: Skin, slot_index: c.size_t, placeholder_name: cstring) -> Attachment ---
	skin_remove_attachment :: proc(self: Skin, slot_index: c.size_t, placeholder_name: cstring) ---
	skin_find_attachments_for_slot :: proc(self: Skin, slot_index: c.size_t, attachments: ArrayAttachment) ---
	skin_get_name :: proc(self: Skin) -> cstring ---
	skin_add_skin :: proc(self: Skin, other: Skin) ---
	skin_copy_skin :: proc(self: Skin, other: Skin) ---
	skin_get_bones :: proc(self: Skin) -> ArrayBoneData ---
	skin_get_constraints :: proc(self: Skin) -> ArrayConstraintData ---
	skin_get_color :: proc(self: Skin) -> Color ---
	slider_create :: proc(data: SliderData, skeleton: Skeleton) -> Slider ---
	slider_dispose :: proc(self: Slider) ---
	slider_get_rtti :: proc(self: Slider) -> Rtti ---
	slider_copy :: proc(self: Slider, skeleton: Skeleton) -> Slider ---
	slider_update :: proc(self: Slider, skeleton: Skeleton, physics: Physics) ---
	slider_sort :: proc(self: Slider, skeleton: Skeleton) ---
	slider_is_source_active :: proc(self: Slider) -> c.bool ---
	slider_get_bone :: proc(self: Slider) -> Bone ---
	slider_set_bone :: proc(self: Slider, bone: Bone) ---
	slider_get_data :: proc(self: Slider) -> SliderData ---
	slider_get_pose :: proc(self: Slider) -> SliderPose ---
	slider_get_applied_pose :: proc(self: Slider) -> SliderPose ---
	slider_reset_constrained :: proc(self: Slider) ---
	slider_constrained :: proc(self: Slider) ---
	slider_is_pose_equal_to_applied :: proc(self: Slider) -> c.bool ---
	slider_is_active :: proc(self: Slider) -> c.bool ---
	slider_set_active :: proc(self: Slider, active: c.bool) ---
	slider_rtti :: proc() -> Rtti ---
	slider_base_dispose :: proc(self: SliderBase) ---
	slider_base_get_data :: proc(self: SliderBase) -> SliderData ---
	slider_base_get_pose :: proc(self: SliderBase) -> SliderPose ---
	slider_base_get_applied_pose :: proc(self: SliderBase) -> SliderPose ---
	slider_base_reset_constrained :: proc(self: SliderBase) ---
	slider_base_constrained :: proc(self: SliderBase) ---
	slider_base_is_pose_equal_to_applied :: proc(self: SliderBase) -> c.bool ---
	slider_base_is_active :: proc(self: SliderBase) -> c.bool ---
	slider_base_set_active :: proc(self: SliderBase, active: c.bool) ---
	slider_base_get_rtti :: proc(self: SliderBase) -> Rtti ---
	slider_base_sort :: proc(self: SliderBase, skeleton: Skeleton) ---
	slider_base_is_source_active :: proc(self: SliderBase) -> c.bool ---
	slider_base_update :: proc(self: SliderBase, skeleton: Skeleton, physics: Physics) ---
	slider_base_rtti :: proc() -> Rtti ---
	slider_data_create :: proc(name: cstring) -> SliderData ---
	slider_data_dispose :: proc(self: SliderData) ---
	slider_data_get_rtti :: proc(self: SliderData) -> Rtti ---
	slider_data_create_method :: proc(self: SliderData, skeleton: Skeleton) -> Constraint ---
	slider_data_get_animation :: proc(self: SliderData) -> Animation ---
	slider_data_set_animation :: proc(self: SliderData, animation: Animation) ---
	slider_data_get_additive :: proc(self: SliderData) -> c.bool ---
	slider_data_set_additive :: proc(self: SliderData, additive: c.bool) ---
	slider_data_get_loop :: proc(self: SliderData) -> c.bool ---
	slider_data_set_loop :: proc(self: SliderData, loop: c.bool) ---
	slider_data_get_bone :: proc(self: SliderData) -> BoneData ---
	slider_data_set_bone :: proc(self: SliderData, bone: BoneData) ---
	slider_data_get_property :: proc(self: SliderData) -> FromProperty ---
	slider_data_set_property :: proc(self: SliderData, property: FromProperty) ---
	slider_data_get_scale :: proc(self: SliderData) -> c.float ---
	slider_data_set_scale :: proc(self: SliderData, scale: c.float) ---
	slider_data_get_offset :: proc(self: SliderData) -> c.float ---
	slider_data_set_offset :: proc(self: SliderData, offset: c.float) ---
	slider_data_get_local :: proc(self: SliderData) -> c.bool ---
	slider_data_set_local :: proc(self: SliderData, local: c.bool) ---
	slider_data_get_name :: proc(self: SliderData) -> cstring ---
	slider_data_get_skin_required :: proc(self: SliderData) -> c.bool ---
	slider_data_get_setup_pose :: proc(self: SliderData) -> SliderPose ---
	slider_data_set_skin_required :: proc(self: SliderData, skin_required: c.bool) ---
	slider_data_rtti :: proc() -> Rtti ---
	slider_mix_timeline_create :: proc(frame_count: c.size_t, bezier_count: c.size_t, slider_index: c.int) -> SliderMixTimeline ---
	slider_mix_timeline_dispose :: proc(self: SliderMixTimeline) ---
	slider_mix_timeline_get_rtti :: proc(self: SliderMixTimeline) -> Rtti ---
	slider_mix_timeline_apply :: proc(self: SliderMixTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	slider_mix_timeline_get_constraint_index :: proc(self: SliderMixTimeline) -> c.int ---
	slider_mix_timeline_set_constraint_index :: proc(self: SliderMixTimeline, in_value: c.int) ---
	slider_mix_timeline_set_frame :: proc(self: SliderMixTimeline, frame: c.size_t, time: c.float, value: c.float) ---
	slider_mix_timeline_get_curve_value :: proc(self: SliderMixTimeline, time: c.float) -> c.float ---
	slider_mix_timeline_get_relative_value :: proc(self: SliderMixTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	slider_mix_timeline_get_absolute_value_1 :: proc(self: SliderMixTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	slider_mix_timeline_get_absolute_value_2 :: proc(self: SliderMixTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float, value: c.float) -> c.float ---
	slider_mix_timeline_get_scale_value :: proc(self: SliderMixTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, current: c.float, setup: c.float) -> c.float ---
	slider_mix_timeline_set_linear :: proc(self: SliderMixTimeline, frame: c.size_t) ---
	slider_mix_timeline_set_stepped :: proc(self: SliderMixTimeline, frame: c.size_t) ---
	slider_mix_timeline_set_bezier :: proc(self: SliderMixTimeline, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	slider_mix_timeline_get_bezier_value :: proc(self: SliderMixTimeline, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	slider_mix_timeline_get_curves :: proc(self: SliderMixTimeline) -> ArrayFloat ---
	slider_mix_timeline_get_additive :: proc(self: SliderMixTimeline) -> c.bool ---
	slider_mix_timeline_get_instant :: proc(self: SliderMixTimeline) -> c.bool ---
	slider_mix_timeline_get_frame_entries :: proc(self: SliderMixTimeline) -> c.size_t ---
	slider_mix_timeline_get_frame_count :: proc(self: SliderMixTimeline) -> c.size_t ---
	slider_mix_timeline_get_frames :: proc(self: SliderMixTimeline) -> ArrayFloat ---
	slider_mix_timeline_get_duration :: proc(self: SliderMixTimeline) -> c.float ---
	slider_mix_timeline_get_property_ids :: proc(self: SliderMixTimeline) -> ArrayPropertyId ---
	slider_mix_timeline_rtti :: proc() -> Rtti ---
	slider_pose_create :: proc() -> SliderPose ---
	slider_pose_dispose :: proc(self: SliderPose) ---
	slider_pose_set :: proc(self: SliderPose, pose: SliderPose) ---
	slider_pose_get_time :: proc(self: SliderPose) -> c.float ---
	slider_pose_set_time :: proc(self: SliderPose, time: c.float) ---
	slider_pose_get_mix :: proc(self: SliderPose) -> c.float ---
	slider_pose_set_mix :: proc(self: SliderPose, mix: c.float) ---
	slider_timeline_create :: proc(frame_count: c.size_t, bezier_count: c.size_t, slider_index: c.int) -> SliderTimeline ---
	slider_timeline_dispose :: proc(self: SliderTimeline) ---
	slider_timeline_get_rtti :: proc(self: SliderTimeline) -> Rtti ---
	slider_timeline_apply :: proc(self: SliderTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	slider_timeline_get_constraint_index :: proc(self: SliderTimeline) -> c.int ---
	slider_timeline_set_constraint_index :: proc(self: SliderTimeline, in_value: c.int) ---
	slider_timeline_set_frame :: proc(self: SliderTimeline, frame: c.size_t, time: c.float, value: c.float) ---
	slider_timeline_get_curve_value :: proc(self: SliderTimeline, time: c.float) -> c.float ---
	slider_timeline_get_relative_value :: proc(self: SliderTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	slider_timeline_get_absolute_value_1 :: proc(self: SliderTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	slider_timeline_get_absolute_value_2 :: proc(self: SliderTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float, value: c.float) -> c.float ---
	slider_timeline_get_scale_value :: proc(self: SliderTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, current: c.float, setup: c.float) -> c.float ---
	slider_timeline_set_linear :: proc(self: SliderTimeline, frame: c.size_t) ---
	slider_timeline_set_stepped :: proc(self: SliderTimeline, frame: c.size_t) ---
	slider_timeline_set_bezier :: proc(self: SliderTimeline, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	slider_timeline_get_bezier_value :: proc(self: SliderTimeline, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	slider_timeline_get_curves :: proc(self: SliderTimeline) -> ArrayFloat ---
	slider_timeline_get_additive :: proc(self: SliderTimeline) -> c.bool ---
	slider_timeline_get_instant :: proc(self: SliderTimeline) -> c.bool ---
	slider_timeline_get_frame_entries :: proc(self: SliderTimeline) -> c.size_t ---
	slider_timeline_get_frame_count :: proc(self: SliderTimeline) -> c.size_t ---
	slider_timeline_get_frames :: proc(self: SliderTimeline) -> ArrayFloat ---
	slider_timeline_get_duration :: proc(self: SliderTimeline) -> c.float ---
	slider_timeline_get_property_ids :: proc(self: SliderTimeline) -> ArrayPropertyId ---
	slider_timeline_rtti :: proc() -> Rtti ---
	slot_create :: proc(data: SlotData, skeleton: Skeleton) -> Slot ---
	slot_dispose :: proc(self: Slot) ---
	slot_get_bone :: proc(self: Slot) -> Bone ---
	slot_setup_pose :: proc(self: Slot) ---
	slot_get_data :: proc(self: Slot) -> SlotData ---
	slot_get_pose :: proc(self: Slot) -> SlotPose ---
	slot_get_applied_pose :: proc(self: Slot) -> SlotPose ---
	slot_reset_constrained :: proc(self: Slot) ---
	slot_constrained :: proc(self: Slot) ---
	slot_is_pose_equal_to_applied :: proc(self: Slot) -> c.bool ---
	slot_curve_timeline_dispose :: proc(self: SlotCurveTimeline) ---
	slot_curve_timeline_get_rtti :: proc(self: SlotCurveTimeline) -> Rtti ---
	slot_curve_timeline_apply :: proc(self: SlotCurveTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	slot_curve_timeline_get_slot_index :: proc(self: SlotCurveTimeline) -> c.int ---
	slot_curve_timeline_set_slot_index :: proc(self: SlotCurveTimeline, in_value: c.int) ---
	slot_curve_timeline_set_linear :: proc(self: SlotCurveTimeline, frame: c.size_t) ---
	slot_curve_timeline_set_stepped :: proc(self: SlotCurveTimeline, frame: c.size_t) ---
	slot_curve_timeline_set_bezier :: proc(self: SlotCurveTimeline, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	slot_curve_timeline_get_bezier_value :: proc(self: SlotCurveTimeline, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	slot_curve_timeline_get_curves :: proc(self: SlotCurveTimeline) -> ArrayFloat ---
	slot_curve_timeline_get_additive :: proc(self: SlotCurveTimeline) -> c.bool ---
	slot_curve_timeline_get_instant :: proc(self: SlotCurveTimeline) -> c.bool ---
	slot_curve_timeline_get_frame_entries :: proc(self: SlotCurveTimeline) -> c.size_t ---
	slot_curve_timeline_get_frame_count :: proc(self: SlotCurveTimeline) -> c.size_t ---
	slot_curve_timeline_get_frames :: proc(self: SlotCurveTimeline) -> ArrayFloat ---
	slot_curve_timeline_get_duration :: proc(self: SlotCurveTimeline) -> c.float ---
	slot_curve_timeline_get_property_ids :: proc(self: SlotCurveTimeline) -> ArrayPropertyId ---
	slot_curve_timeline_rtti :: proc() -> Rtti ---
	slot_data_create :: proc(index: c.int, name: cstring, bone_data: BoneData) -> SlotData ---
	slot_data_dispose :: proc(self: SlotData) ---
	slot_data_get_index :: proc(self: SlotData) -> c.int ---
	slot_data_get_bone_data :: proc(self: SlotData) -> BoneData ---
	slot_data_set_attachment_name :: proc(self: SlotData, attachment_name: cstring) ---
	slot_data_get_attachment_name :: proc(self: SlotData) -> cstring ---
	slot_data_get_blend_mode :: proc(self: SlotData) -> BlendMode ---
	slot_data_set_blend_mode :: proc(self: SlotData, blend_mode: BlendMode) ---
	slot_data_get_visible :: proc(self: SlotData) -> c.bool ---
	slot_data_set_visible :: proc(self: SlotData, visible: c.bool) ---
	slot_data_get_setup_pose :: proc(self: SlotData) -> SlotPose ---
	slot_data_get_name :: proc(self: SlotData) -> cstring ---
	slot_data_get_skin_required :: proc(self: SlotData) -> c.bool ---
	slot_data_set_skin_required :: proc(self: SlotData, skin_required: c.bool) ---
	slot_pose_create :: proc() -> SlotPose ---
	slot_pose_dispose :: proc(self: SlotPose) ---
	slot_pose_set :: proc(self: SlotPose, pose: SlotPose) ---
	slot_pose_get_color :: proc(self: SlotPose) -> Color ---
	slot_pose_get_dark_color :: proc(self: SlotPose) -> Color ---
	slot_pose_has_dark_color :: proc(self: SlotPose) -> c.bool ---
	slot_pose_set_has_dark_color :: proc(self: SlotPose, has_dark_color: c.bool) ---
	slot_pose_get_attachment :: proc(self: SlotPose) -> Attachment ---
	slot_pose_set_attachment :: proc(self: SlotPose, attachment: Attachment) ---
	slot_pose_get_sequence_index :: proc(self: SlotPose) -> c.int ---
	slot_pose_set_sequence_index :: proc(self: SlotPose, sequence_index: c.int) ---
	slot_pose_get_deform :: proc(self: SlotPose) -> ArrayFloat ---
	slot_timeline_dispose :: proc(self: SlotTimeline) ---
	slot_timeline_get_rtti :: proc(self: SlotTimeline) -> Rtti ---
	slot_timeline_get_slot_index :: proc(self: SlotTimeline) -> c.int ---
	slot_timeline_set_slot_index :: proc(self: SlotTimeline, in_value: c.int) ---
	slot_timeline_rtti :: proc() -> Rtti ---
	texture_region_create :: proc() -> TextureRegion ---
	texture_region_dispose :: proc(self: TextureRegion) ---
	texture_region_get_rtti :: proc(self: TextureRegion) -> Rtti ---
	texture_region_get_u :: proc(self: TextureRegion) -> c.float ---
	texture_region_set_u :: proc(self: TextureRegion, value: c.float) ---
	texture_region_get_v :: proc(self: TextureRegion) -> c.float ---
	texture_region_set_v :: proc(self: TextureRegion, value: c.float) ---
	texture_region_get_u2 :: proc(self: TextureRegion) -> c.float ---
	texture_region_set_u2 :: proc(self: TextureRegion, value: c.float) ---
	texture_region_get_v2 :: proc(self: TextureRegion) -> c.float ---
	texture_region_set_v2 :: proc(self: TextureRegion, value: c.float) ---
	texture_region_get_region_width :: proc(self: TextureRegion) -> c.int ---
	texture_region_set_region_width :: proc(self: TextureRegion, value: c.int) ---
	texture_region_get_region_height :: proc(self: TextureRegion) -> c.int ---
	texture_region_set_region_height :: proc(self: TextureRegion, value: c.int) ---
	texture_region_get_renderer_object :: proc(self: TextureRegion) -> rawptr ---
	texture_region_set_renderer_object :: proc(self: TextureRegion, value: rawptr) ---
	texture_region_rtti :: proc() -> Rtti ---
	timeline_dispose :: proc(self: Timeline) ---
	timeline_get_rtti :: proc(self: Timeline) -> Rtti ---
	timeline_apply :: proc(self: Timeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	timeline_get_additive :: proc(self: Timeline) -> c.bool ---
	timeline_get_instant :: proc(self: Timeline) -> c.bool ---
	timeline_get_frame_entries :: proc(self: Timeline) -> c.size_t ---
	timeline_get_frame_count :: proc(self: Timeline) -> c.size_t ---
	timeline_get_frames :: proc(self: Timeline) -> ArrayFloat ---
	timeline_get_duration :: proc(self: Timeline) -> c.float ---
	timeline_get_property_ids :: proc(self: Timeline) -> ArrayPropertyId ---
	timeline_rtti :: proc() -> Rtti ---
	to_property_dispose :: proc(self: ToProperty) ---
	to_property_get_rtti :: proc(self: ToProperty) -> Rtti ---
	to_property_mix :: proc(self: ToProperty, pose: TransformConstraintPose) -> c.float ---
	to_property_apply :: proc(self: ToProperty, skeleton: Skeleton, pose: TransformConstraintPose, bone: BonePose, value: c.float, local: c.bool, additive: c.bool) ---
	to_property_rtti :: proc() -> Rtti ---
	to_property_get__offset :: proc(self: ToProperty) -> c.float ---
	to_property_set__offset :: proc(self: ToProperty, value: c.float) ---
	to_property_get__max :: proc(self: ToProperty) -> c.float ---
	to_property_set__max :: proc(self: ToProperty, value: c.float) ---
	to_property_get__scale :: proc(self: ToProperty) -> c.float ---
	to_property_set__scale :: proc(self: ToProperty, value: c.float) ---
	to_rotate_create :: proc() -> ToRotate ---
	to_rotate_dispose :: proc(self: ToRotate) ---
	to_rotate_get_rtti :: proc(self: ToRotate) -> Rtti ---
	to_rotate_mix :: proc(self: ToRotate, pose: TransformConstraintPose) -> c.float ---
	to_rotate_apply :: proc(self: ToRotate, skeleton: Skeleton, pose: TransformConstraintPose, bone: BonePose, value: c.float, local: c.bool, additive: c.bool) ---
	to_rotate_rtti :: proc() -> Rtti ---
	to_scale_x_create :: proc() -> ToScaleX ---
	to_scale_x_dispose :: proc(self: ToScaleX) ---
	to_scale_x_get_rtti :: proc(self: ToScaleX) -> Rtti ---
	to_scale_x_mix :: proc(self: ToScaleX, pose: TransformConstraintPose) -> c.float ---
	to_scale_x_apply :: proc(self: ToScaleX, skeleton: Skeleton, pose: TransformConstraintPose, bone: BonePose, value: c.float, local: c.bool, additive: c.bool) ---
	to_scale_x_rtti :: proc() -> Rtti ---
	to_scale_y_create :: proc() -> ToScaleY ---
	to_scale_y_dispose :: proc(self: ToScaleY) ---
	to_scale_y_get_rtti :: proc(self: ToScaleY) -> Rtti ---
	to_scale_y_mix :: proc(self: ToScaleY, pose: TransformConstraintPose) -> c.float ---
	to_scale_y_apply :: proc(self: ToScaleY, skeleton: Skeleton, pose: TransformConstraintPose, bone: BonePose, value: c.float, local: c.bool, additive: c.bool) ---
	to_scale_y_rtti :: proc() -> Rtti ---
	to_shear_y_create :: proc() -> ToShearY ---
	to_shear_y_dispose :: proc(self: ToShearY) ---
	to_shear_y_get_rtti :: proc(self: ToShearY) -> Rtti ---
	to_shear_y_mix :: proc(self: ToShearY, pose: TransformConstraintPose) -> c.float ---
	to_shear_y_apply :: proc(self: ToShearY, skeleton: Skeleton, pose: TransformConstraintPose, bone: BonePose, value: c.float, local: c.bool, additive: c.bool) ---
	to_shear_y_rtti :: proc() -> Rtti ---
	to_x_create :: proc() -> ToX ---
	to_x_dispose :: proc(self: ToX) ---
	to_x_get_rtti :: proc(self: ToX) -> Rtti ---
	to_x_mix :: proc(self: ToX, pose: TransformConstraintPose) -> c.float ---
	to_x_apply :: proc(self: ToX, skeleton: Skeleton, pose: TransformConstraintPose, bone: BonePose, value: c.float, local: c.bool, additive: c.bool) ---
	to_x_rtti :: proc() -> Rtti ---
	to_y_create :: proc() -> ToY ---
	to_y_dispose :: proc(self: ToY) ---
	to_y_get_rtti :: proc(self: ToY) -> Rtti ---
	to_y_mix :: proc(self: ToY, pose: TransformConstraintPose) -> c.float ---
	to_y_apply :: proc(self: ToY, skeleton: Skeleton, pose: TransformConstraintPose, bone: BonePose, value: c.float, local: c.bool, additive: c.bool) ---
	to_y_rtti :: proc() -> Rtti ---
	track_entry_create :: proc() -> TrackEntry ---
	track_entry_dispose :: proc(self: TrackEntry) ---
	track_entry_get_track_index :: proc(self: TrackEntry) -> c.int ---
	track_entry_get_animation :: proc(self: TrackEntry) -> Animation ---
	track_entry_set_animation :: proc(self: TrackEntry, animation: Animation) ---
	track_entry_get_previous :: proc(self: TrackEntry) -> TrackEntry ---
	track_entry_get_loop :: proc(self: TrackEntry) -> c.bool ---
	track_entry_set_loop :: proc(self: TrackEntry, in_value: c.bool) ---
	track_entry_get_additive :: proc(self: TrackEntry) -> c.bool ---
	track_entry_set_additive :: proc(self: TrackEntry, in_value: c.bool) ---
	track_entry_get_reverse :: proc(self: TrackEntry) -> c.bool ---
	track_entry_set_reverse :: proc(self: TrackEntry, in_value: c.bool) ---
	track_entry_get_shortest_rotation :: proc(self: TrackEntry) -> c.bool ---
	track_entry_set_shortest_rotation :: proc(self: TrackEntry, in_value: c.bool) ---
	track_entry_get_delay :: proc(self: TrackEntry) -> c.float ---
	track_entry_set_delay :: proc(self: TrackEntry, in_value: c.float) ---
	track_entry_get_track_time :: proc(self: TrackEntry) -> c.float ---
	track_entry_set_track_time :: proc(self: TrackEntry, in_value: c.float) ---
	track_entry_get_track_end :: proc(self: TrackEntry) -> c.float ---
	track_entry_set_track_end :: proc(self: TrackEntry, in_value: c.float) ---
	track_entry_get_animation_start :: proc(self: TrackEntry) -> c.float ---
	track_entry_set_animation_start :: proc(self: TrackEntry, in_value: c.float) ---
	track_entry_get_animation_end :: proc(self: TrackEntry) -> c.float ---
	track_entry_set_animation_end :: proc(self: TrackEntry, in_value: c.float) ---
	track_entry_get_animation_last :: proc(self: TrackEntry) -> c.float ---
	track_entry_set_animation_last :: proc(self: TrackEntry, in_value: c.float) ---
	track_entry_get_animation_time :: proc(self: TrackEntry) -> c.float ---
	track_entry_get_time_scale :: proc(self: TrackEntry) -> c.float ---
	track_entry_set_time_scale :: proc(self: TrackEntry, in_value: c.float) ---
	track_entry_get_alpha :: proc(self: TrackEntry) -> c.float ---
	track_entry_set_alpha :: proc(self: TrackEntry, in_value: c.float) ---
	track_entry_get_event_threshold :: proc(self: TrackEntry) -> c.float ---
	track_entry_set_event_threshold :: proc(self: TrackEntry, in_value: c.float) ---
	track_entry_get_mix_attachment_threshold :: proc(self: TrackEntry) -> c.float ---
	track_entry_set_mix_attachment_threshold :: proc(self: TrackEntry, in_value: c.float) ---
	track_entry_get_alpha_attachment_threshold :: proc(self: TrackEntry) -> c.float ---
	track_entry_set_alpha_attachment_threshold :: proc(self: TrackEntry, in_value: c.float) ---
	track_entry_get_mix_draw_order_threshold :: proc(self: TrackEntry) -> c.float ---
	track_entry_set_mix_draw_order_threshold :: proc(self: TrackEntry, in_value: c.float) ---
	track_entry_get_next :: proc(self: TrackEntry) -> TrackEntry ---
	track_entry_is_complete :: proc(self: TrackEntry) -> c.bool ---
	track_entry_get_mix_time :: proc(self: TrackEntry) -> c.float ---
	track_entry_set_mix_time :: proc(self: TrackEntry, in_value: c.float) ---
	track_entry_get_mix_duration :: proc(self: TrackEntry) -> c.float ---
	track_entry_set_mix_duration_1 :: proc(self: TrackEntry, in_value: c.float) ---
	track_entry_set_mix_duration_2 :: proc(self: TrackEntry, mix_duration: c.float, delay: c.float) ---
	track_entry_get_mixing_from :: proc(self: TrackEntry) -> TrackEntry ---
	track_entry_get_mixing_to :: proc(self: TrackEntry) -> TrackEntry ---
	track_entry_reset_rotation_directions :: proc(self: TrackEntry) ---
	track_entry_get_track_complete :: proc(self: TrackEntry) -> c.float ---
	track_entry_is_empty_animation :: proc(self: TrackEntry) -> c.bool ---
	track_entry_was_applied :: proc(self: TrackEntry) -> c.bool ---
	track_entry_is_next_ready :: proc(self: TrackEntry) -> c.bool ---
	track_entry_get_animation_state :: proc(self: TrackEntry) -> AnimationState ---
	track_entry_set_animation_state :: proc(self: TrackEntry, state: AnimationState) ---
	track_entry_get_renderer_object :: proc(self: TrackEntry) -> rawptr ---
	transform_constraint_create :: proc(data: TransformConstraintData, skeleton: Skeleton) -> TransformConstraint ---
	transform_constraint_dispose :: proc(self: TransformConstraint) ---
	transform_constraint_get_rtti :: proc(self: TransformConstraint) -> Rtti ---
	transform_constraint_copy :: proc(self: TransformConstraint, skeleton: Skeleton) -> TransformConstraint ---
	transform_constraint_update :: proc(self: TransformConstraint, skeleton: Skeleton, physics: Physics) ---
	transform_constraint_sort :: proc(self: TransformConstraint, skeleton: Skeleton) ---
	transform_constraint_is_source_active :: proc(self: TransformConstraint) -> c.bool ---
	transform_constraint_get_bones :: proc(self: TransformConstraint) -> ArrayBonePose ---
	transform_constraint_get_source :: proc(self: TransformConstraint) -> Bone ---
	transform_constraint_set_source :: proc(self: TransformConstraint, source: Bone) ---
	transform_constraint_get_data :: proc(self: TransformConstraint) -> TransformConstraintData ---
	transform_constraint_get_pose :: proc(self: TransformConstraint) -> TransformConstraintPose ---
	transform_constraint_get_applied_pose :: proc(self: TransformConstraint) -> TransformConstraintPose ---
	transform_constraint_reset_constrained :: proc(self: TransformConstraint) ---
	transform_constraint_constrained :: proc(self: TransformConstraint) ---
	transform_constraint_is_pose_equal_to_applied :: proc(self: TransformConstraint) -> c.bool ---
	transform_constraint_is_active :: proc(self: TransformConstraint) -> c.bool ---
	transform_constraint_set_active :: proc(self: TransformConstraint, active: c.bool) ---
	transform_constraint_rtti :: proc() -> Rtti ---
	transform_constraint_base_dispose :: proc(self: TransformConstraintBase) ---
	transform_constraint_base_get_data :: proc(self: TransformConstraintBase) -> TransformConstraintData ---
	transform_constraint_base_get_pose :: proc(self: TransformConstraintBase) -> TransformConstraintPose ---
	transform_constraint_base_get_applied_pose :: proc(self: TransformConstraintBase) -> TransformConstraintPose ---
	transform_constraint_base_reset_constrained :: proc(self: TransformConstraintBase) ---
	transform_constraint_base_constrained :: proc(self: TransformConstraintBase) ---
	transform_constraint_base_is_pose_equal_to_applied :: proc(self: TransformConstraintBase) -> c.bool ---
	transform_constraint_base_is_active :: proc(self: TransformConstraintBase) -> c.bool ---
	transform_constraint_base_set_active :: proc(self: TransformConstraintBase, active: c.bool) ---
	transform_constraint_base_get_rtti :: proc(self: TransformConstraintBase) -> Rtti ---
	transform_constraint_base_sort :: proc(self: TransformConstraintBase, skeleton: Skeleton) ---
	transform_constraint_base_is_source_active :: proc(self: TransformConstraintBase) -> c.bool ---
	transform_constraint_base_update :: proc(self: TransformConstraintBase, skeleton: Skeleton, physics: Physics) ---
	transform_constraint_base_rtti :: proc() -> Rtti ---
	transform_constraint_data_create :: proc(name: cstring) -> TransformConstraintData ---
	transform_constraint_data_dispose :: proc(self: TransformConstraintData) ---
	transform_constraint_data_get_rtti :: proc(self: TransformConstraintData) -> Rtti ---
	transform_constraint_data_create_method :: proc(self: TransformConstraintData, skeleton: Skeleton) -> Constraint ---
	transform_constraint_data_get_bones :: proc(self: TransformConstraintData) -> ArrayBoneData ---
	transform_constraint_data_get_source :: proc(self: TransformConstraintData) -> BoneData ---
	transform_constraint_data_set_source :: proc(self: TransformConstraintData, source: BoneData) ---
	transform_constraint_data_get_offset_rotation :: proc(self: TransformConstraintData) -> c.float ---
	transform_constraint_data_set_offset_rotation :: proc(self: TransformConstraintData, offset_rotation: c.float) ---
	transform_constraint_data_get_offset_x :: proc(self: TransformConstraintData) -> c.float ---
	transform_constraint_data_set_offset_x :: proc(self: TransformConstraintData, offset_x: c.float) ---
	transform_constraint_data_get_offset_y :: proc(self: TransformConstraintData) -> c.float ---
	transform_constraint_data_set_offset_y :: proc(self: TransformConstraintData, offset_y: c.float) ---
	transform_constraint_data_get_offset_scale_x :: proc(self: TransformConstraintData) -> c.float ---
	transform_constraint_data_set_offset_scale_x :: proc(self: TransformConstraintData, offset_scale_x: c.float) ---
	transform_constraint_data_get_offset_scale_y :: proc(self: TransformConstraintData) -> c.float ---
	transform_constraint_data_set_offset_scale_y :: proc(self: TransformConstraintData, offset_scale_y: c.float) ---
	transform_constraint_data_get_offset_shear_y :: proc(self: TransformConstraintData) -> c.float ---
	transform_constraint_data_set_offset_shear_y :: proc(self: TransformConstraintData, offset_shear_y: c.float) ---
	transform_constraint_data_get_local_source :: proc(self: TransformConstraintData) -> c.bool ---
	transform_constraint_data_set_local_source :: proc(self: TransformConstraintData, local_source: c.bool) ---
	transform_constraint_data_get_local_target :: proc(self: TransformConstraintData) -> c.bool ---
	transform_constraint_data_set_local_target :: proc(self: TransformConstraintData, local_target: c.bool) ---
	transform_constraint_data_get_additive :: proc(self: TransformConstraintData) -> c.bool ---
	transform_constraint_data_set_additive :: proc(self: TransformConstraintData, additive: c.bool) ---
	transform_constraint_data_get_clamp :: proc(self: TransformConstraintData) -> c.bool ---
	transform_constraint_data_set_clamp :: proc(self: TransformConstraintData, clamp: c.bool) ---
	transform_constraint_data_get_properties :: proc(self: TransformConstraintData) -> ArrayFromProperty ---
	transform_constraint_data_get_name :: proc(self: TransformConstraintData) -> cstring ---
	transform_constraint_data_get_skin_required :: proc(self: TransformConstraintData) -> c.bool ---
	transform_constraint_data_get_setup_pose :: proc(self: TransformConstraintData) -> TransformConstraintPose ---
	transform_constraint_data_set_skin_required :: proc(self: TransformConstraintData, skin_required: c.bool) ---
	transform_constraint_data_rtti :: proc() -> Rtti ---
	transform_constraint_pose_create :: proc() -> TransformConstraintPose ---
	transform_constraint_pose_dispose :: proc(self: TransformConstraintPose) ---
	transform_constraint_pose_set :: proc(self: TransformConstraintPose, pose: TransformConstraintPose) ---
	transform_constraint_pose_get_mix_rotate :: proc(self: TransformConstraintPose) -> c.float ---
	transform_constraint_pose_set_mix_rotate :: proc(self: TransformConstraintPose, mix_rotate: c.float) ---
	transform_constraint_pose_get_mix_x :: proc(self: TransformConstraintPose) -> c.float ---
	transform_constraint_pose_set_mix_x :: proc(self: TransformConstraintPose, mix_x: c.float) ---
	transform_constraint_pose_get_mix_y :: proc(self: TransformConstraintPose) -> c.float ---
	transform_constraint_pose_set_mix_y :: proc(self: TransformConstraintPose, mix_y: c.float) ---
	transform_constraint_pose_get_mix_scale_x :: proc(self: TransformConstraintPose) -> c.float ---
	transform_constraint_pose_set_mix_scale_x :: proc(self: TransformConstraintPose, mix_scale_x: c.float) ---
	transform_constraint_pose_get_mix_scale_y :: proc(self: TransformConstraintPose) -> c.float ---
	transform_constraint_pose_set_mix_scale_y :: proc(self: TransformConstraintPose, mix_scale_y: c.float) ---
	transform_constraint_pose_get_mix_shear_y :: proc(self: TransformConstraintPose) -> c.float ---
	transform_constraint_pose_set_mix_shear_y :: proc(self: TransformConstraintPose, mix_shear_y: c.float) ---
	transform_constraint_timeline_create :: proc(frame_count: c.size_t, bezier_count: c.size_t, transform_constraint_index: c.int) -> TransformConstraintTimeline ---
	transform_constraint_timeline_dispose :: proc(self: TransformConstraintTimeline) ---
	transform_constraint_timeline_get_rtti :: proc(self: TransformConstraintTimeline) -> Rtti ---
	transform_constraint_timeline_apply :: proc(self: TransformConstraintTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	transform_constraint_timeline_set_frame :: proc(self: TransformConstraintTimeline, frame: c.int, time: c.float, mix_rotate: c.float, mix_x: c.float, mix_y: c.float, mix_scale_x: c.float, mix_scale_y: c.float, mix_shear_y: c.float) ---
	transform_constraint_timeline_get_constraint_index :: proc(self: TransformConstraintTimeline) -> c.int ---
	transform_constraint_timeline_set_constraint_index :: proc(self: TransformConstraintTimeline, in_value: c.int) ---
	transform_constraint_timeline_set_linear :: proc(self: TransformConstraintTimeline, frame: c.size_t) ---
	transform_constraint_timeline_set_stepped :: proc(self: TransformConstraintTimeline, frame: c.size_t) ---
	transform_constraint_timeline_set_bezier :: proc(self: TransformConstraintTimeline, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	transform_constraint_timeline_get_bezier_value :: proc(self: TransformConstraintTimeline, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	transform_constraint_timeline_get_curves :: proc(self: TransformConstraintTimeline) -> ArrayFloat ---
	transform_constraint_timeline_get_additive :: proc(self: TransformConstraintTimeline) -> c.bool ---
	transform_constraint_timeline_get_instant :: proc(self: TransformConstraintTimeline) -> c.bool ---
	transform_constraint_timeline_get_frame_entries :: proc(self: TransformConstraintTimeline) -> c.size_t ---
	transform_constraint_timeline_get_frame_count :: proc(self: TransformConstraintTimeline) -> c.size_t ---
	transform_constraint_timeline_get_frames :: proc(self: TransformConstraintTimeline) -> ArrayFloat ---
	transform_constraint_timeline_get_duration :: proc(self: TransformConstraintTimeline) -> c.float ---
	transform_constraint_timeline_get_property_ids :: proc(self: TransformConstraintTimeline) -> ArrayPropertyId ---
	transform_constraint_timeline_rtti :: proc() -> Rtti ---
	translate_timeline_create :: proc(frame_count: c.size_t, bezier_count: c.size_t, bone_index: c.int) -> TranslateTimeline ---
	translate_timeline_dispose :: proc(self: TranslateTimeline) ---
	translate_timeline_get_rtti :: proc(self: TranslateTimeline) -> Rtti ---
	translate_timeline_apply :: proc(self: TranslateTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	translate_timeline_get_bone_index :: proc(self: TranslateTimeline) -> c.int ---
	translate_timeline_set_bone_index :: proc(self: TranslateTimeline, in_value: c.int) ---
	translate_timeline_set_frame :: proc(self: TranslateTimeline, frame: c.size_t, time: c.float, value1: c.float, value2: c.float) ---
	translate_timeline_set_linear :: proc(self: TranslateTimeline, frame: c.size_t) ---
	translate_timeline_set_stepped :: proc(self: TranslateTimeline, frame: c.size_t) ---
	translate_timeline_set_bezier :: proc(self: TranslateTimeline, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	translate_timeline_get_bezier_value :: proc(self: TranslateTimeline, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	translate_timeline_get_curves :: proc(self: TranslateTimeline) -> ArrayFloat ---
	translate_timeline_get_additive :: proc(self: TranslateTimeline) -> c.bool ---
	translate_timeline_get_instant :: proc(self: TranslateTimeline) -> c.bool ---
	translate_timeline_get_frame_entries :: proc(self: TranslateTimeline) -> c.size_t ---
	translate_timeline_get_frame_count :: proc(self: TranslateTimeline) -> c.size_t ---
	translate_timeline_get_frames :: proc(self: TranslateTimeline) -> ArrayFloat ---
	translate_timeline_get_duration :: proc(self: TranslateTimeline) -> c.float ---
	translate_timeline_get_property_ids :: proc(self: TranslateTimeline) -> ArrayPropertyId ---
	translate_timeline_rtti :: proc() -> Rtti ---
	translate_x_timeline_create :: proc(frame_count: c.size_t, bezier_count: c.size_t, bone_index: c.int) -> TranslateXTimeline ---
	translate_x_timeline_dispose :: proc(self: TranslateXTimeline) ---
	translate_x_timeline_get_rtti :: proc(self: TranslateXTimeline) -> Rtti ---
	translate_x_timeline_apply :: proc(self: TranslateXTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	translate_x_timeline_get_bone_index :: proc(self: TranslateXTimeline) -> c.int ---
	translate_x_timeline_set_bone_index :: proc(self: TranslateXTimeline, in_value: c.int) ---
	translate_x_timeline_set_frame :: proc(self: TranslateXTimeline, frame: c.size_t, time: c.float, value: c.float) ---
	translate_x_timeline_get_curve_value :: proc(self: TranslateXTimeline, time: c.float) -> c.float ---
	translate_x_timeline_get_relative_value :: proc(self: TranslateXTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	translate_x_timeline_get_absolute_value_1 :: proc(self: TranslateXTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	translate_x_timeline_get_absolute_value_2 :: proc(self: TranslateXTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float, value: c.float) -> c.float ---
	translate_x_timeline_get_scale_value :: proc(self: TranslateXTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, current: c.float, setup: c.float) -> c.float ---
	translate_x_timeline_set_linear :: proc(self: TranslateXTimeline, frame: c.size_t) ---
	translate_x_timeline_set_stepped :: proc(self: TranslateXTimeline, frame: c.size_t) ---
	translate_x_timeline_set_bezier :: proc(self: TranslateXTimeline, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	translate_x_timeline_get_bezier_value :: proc(self: TranslateXTimeline, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	translate_x_timeline_get_curves :: proc(self: TranslateXTimeline) -> ArrayFloat ---
	translate_x_timeline_get_additive :: proc(self: TranslateXTimeline) -> c.bool ---
	translate_x_timeline_get_instant :: proc(self: TranslateXTimeline) -> c.bool ---
	translate_x_timeline_get_frame_entries :: proc(self: TranslateXTimeline) -> c.size_t ---
	translate_x_timeline_get_frame_count :: proc(self: TranslateXTimeline) -> c.size_t ---
	translate_x_timeline_get_frames :: proc(self: TranslateXTimeline) -> ArrayFloat ---
	translate_x_timeline_get_duration :: proc(self: TranslateXTimeline) -> c.float ---
	translate_x_timeline_get_property_ids :: proc(self: TranslateXTimeline) -> ArrayPropertyId ---
	translate_x_timeline_rtti :: proc() -> Rtti ---
	translate_y_timeline_create :: proc(frame_count: c.size_t, bezier_count: c.size_t, bone_index: c.int) -> TranslateYTimeline ---
	translate_y_timeline_dispose :: proc(self: TranslateYTimeline) ---
	translate_y_timeline_get_rtti :: proc(self: TranslateYTimeline) -> Rtti ---
	translate_y_timeline_apply :: proc(self: TranslateYTimeline, skeleton: Skeleton, last_time: c.float, time: c.float, events: ArrayEvent, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, applied_pose: c.bool) ---
	translate_y_timeline_get_bone_index :: proc(self: TranslateYTimeline) -> c.int ---
	translate_y_timeline_set_bone_index :: proc(self: TranslateYTimeline, in_value: c.int) ---
	translate_y_timeline_set_frame :: proc(self: TranslateYTimeline, frame: c.size_t, time: c.float, value: c.float) ---
	translate_y_timeline_get_curve_value :: proc(self: TranslateYTimeline, time: c.float) -> c.float ---
	translate_y_timeline_get_relative_value :: proc(self: TranslateYTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	translate_y_timeline_get_absolute_value_1 :: proc(self: TranslateYTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float) -> c.float ---
	translate_y_timeline_get_absolute_value_2 :: proc(self: TranslateYTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, current: c.float, setup: c.float, value: c.float) -> c.float ---
	translate_y_timeline_get_scale_value :: proc(self: TranslateYTimeline, time: c.float, alpha: c.float, from_setup: c.bool, add: c.bool, out: c.bool, current: c.float, setup: c.float) -> c.float ---
	translate_y_timeline_set_linear :: proc(self: TranslateYTimeline, frame: c.size_t) ---
	translate_y_timeline_set_stepped :: proc(self: TranslateYTimeline, frame: c.size_t) ---
	translate_y_timeline_set_bezier :: proc(self: TranslateYTimeline, bezier: c.size_t, frame: c.size_t, value: c.float, time1: c.float, value1: c.float, cx1: c.float, cy1: c.float, cx2: c.float, cy2: c.float, time2: c.float, value2: c.float) ---
	translate_y_timeline_get_bezier_value :: proc(self: TranslateYTimeline, time: c.float, frame: c.size_t, value_offset: c.size_t, i: c.size_t) -> c.float ---
	translate_y_timeline_get_curves :: proc(self: TranslateYTimeline) -> ArrayFloat ---
	translate_y_timeline_get_additive :: proc(self: TranslateYTimeline) -> c.bool ---
	translate_y_timeline_get_instant :: proc(self: TranslateYTimeline) -> c.bool ---
	translate_y_timeline_get_frame_entries :: proc(self: TranslateYTimeline) -> c.size_t ---
	translate_y_timeline_get_frame_count :: proc(self: TranslateYTimeline) -> c.size_t ---
	translate_y_timeline_get_frames :: proc(self: TranslateYTimeline) -> ArrayFloat ---
	translate_y_timeline_get_duration :: proc(self: TranslateYTimeline) -> c.float ---
	translate_y_timeline_get_property_ids :: proc(self: TranslateYTimeline) -> ArrayPropertyId ---
	translate_y_timeline_rtti :: proc() -> Rtti ---
	update_dispose :: proc(self: Update) ---
	update_get_rtti :: proc(self: Update) -> Rtti ---
	update_update :: proc(self: Update, skeleton: Skeleton, physics: Physics) ---
	update_rtti :: proc() -> Rtti ---
	vertex_attachment_dispose :: proc(self: VertexAttachment) ---
	vertex_attachment_get_rtti :: proc(self: VertexAttachment) -> Rtti ---
	vertex_attachment_compute_world_vertices_1 :: proc(self: VertexAttachment, skeleton: Skeleton, slot: Slot, start: c.size_t, count: c.size_t, world_vertices: [^]c.float, offset: c.size_t, stride: c.size_t) ---
	vertex_attachment_compute_world_vertices_2 :: proc(self: VertexAttachment, skeleton: Skeleton, slot: Slot, start: c.size_t, count: c.size_t, world_vertices: ArrayFloat, offset: c.size_t, stride: c.size_t) ---
	vertex_attachment_get_id :: proc(self: VertexAttachment) -> c.int ---
	vertex_attachment_get_bones :: proc(self: VertexAttachment) -> ArrayInt ---
	vertex_attachment_set_bones :: proc(self: VertexAttachment, bones: ArrayInt) ---
	vertex_attachment_get_vertices :: proc(self: VertexAttachment) -> ArrayFloat ---
	vertex_attachment_set_vertices :: proc(self: VertexAttachment, vertices: ArrayFloat) ---
	vertex_attachment_get_world_vertices_length :: proc(self: VertexAttachment) -> c.size_t ---
	vertex_attachment_set_world_vertices_length :: proc(self: VertexAttachment, in_value: c.size_t) ---
	vertex_attachment_get_timeline_attachment :: proc(self: VertexAttachment) -> Attachment ---
	vertex_attachment_set_timeline_attachment :: proc(self: VertexAttachment, attachment: Attachment) ---
	vertex_attachment_copy_to :: proc(self: VertexAttachment, other: VertexAttachment) ---
	vertex_attachment_get_name :: proc(self: VertexAttachment) -> cstring ---
	vertex_attachment_copy :: proc(self: VertexAttachment) -> Attachment ---
	vertex_attachment_get_timeline_slots :: proc(self: VertexAttachment) -> ArrayInt ---
	vertex_attachment_set_timeline_slots :: proc(self: VertexAttachment, timeline_slots: ArrayInt) ---
	vertex_attachment_is_timeline_active :: proc(self: VertexAttachment, slots: ArraySlot, slot_index: c.int, applied_pose: c.bool) -> c.bool ---
	vertex_attachment_get_ref_count :: proc(self: VertexAttachment) -> c.int ---
	vertex_attachment_reference :: proc(self: VertexAttachment) ---
	vertex_attachment_dereference :: proc(self: VertexAttachment) ---
	vertex_attachment_rtti :: proc() -> Rtti ---
}
