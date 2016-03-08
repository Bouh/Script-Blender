import bpy


selection = bpy.context.selected_objects


bpy.ops.object.select_all(action='DESELECT')


for obj in selection:


	obj.select = True


	#change '2' to whichever pass index you choose
	obj.pass_index = 2

	obj.select = False




for obj in selection:
	obj.select = True