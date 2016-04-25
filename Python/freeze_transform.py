bl_info = {    "name": "Freeze Transform",
    "description": "Adds Freeze transform to the Apply transforms menu (Ctrl A).  Mimics Maya's freeze transform.  The location is transferred to Delta transform and the current location is zeroed",
    "author": "kettlefish",
    "version": (1, 0),
    "blender": (2, 74, 0),
    "location": "View3D > Object > Apply",
    "warning": "", 
    "wiki_url": "",
    "category": "Object"}


#   Adds Freeze transform to apply transform menu
#   
#   Mimics Maya's freeze transform by transfering location attributes to Delta transform and applying scale and rotation.
#   Differs from apply location because rotation pivot will remain at original location rather than
#   snapping to scene origin while location attributes are zeroed out.   




import bpy


def main (context):
    bpy.context.active_object.delta_location+=bpy.context.active_object.location
    bpy.context.active_object.location=[0,0,0]
    bpy.ops.object.transform_apply(location=False, rotation = True, scale = True)


class freezeLocation(bpy.types.Operator):
    """Applies current Location to Delta transform"""
    bl_idname = "object.freezelocation"
    bl_label = "Freeze Transforms"


    def execute(self, context):
        main (context)
        return {'FINISHED'}


def menu_func(self, context):
    self.layout.operator ("object.freezelocation", text="Freeze Transforms")
        
def register():
    bpy.utils.register_class(freezeLocation)
    bpy.types.VIEW3D_MT_object_apply.append(menu_func)




def unregister():
    bpy.utils.unregister_class(freezeLocation)
    bpy.types.VIEW3D_MT_object_apply.remove(menu_func)




if __name__ == "__main__":
    register()