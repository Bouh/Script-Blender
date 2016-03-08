bl_info = {
    "name": "Setup render",
    "author": "Aurélien Vivet",
    "version": (0, 1),
    "blender": (2, 71, 0),
    "location": "View3D > Tools",
    "description": "Cet Operator cree un trou sur une sélection",
    "warning": "",
    "wiki_url": "",
    "category": "Tools"}
    
import bpy, os

episode = "08_EPISODE 08"


def main(context):
    for ob in context.scene.objects:
        print(ob)

#Class Operator Trou
class RenderSETUP(bpy.types.Operator):                  
    """Cet Operator cree un trou sur une sélection"""                   
    bl_idname = "object.rendersetup"                     
    bl_label = "Setup render"        

#    @classmethod                                     
#    def poll(cls, context):                         
#        return context.active_object is not None 

    def execute(self, context):                     
        main(context)                                   
        
##################################

        name = os.path.basename(bpy.data.filepath)
        fname = str(name).split('.')
        name = fname[0]

        
        for scene in bpy.data.scenes:
            print(name)
            
            newpath = r"\\SRV-DATA1\Reseausociaux\PRODUCTIONS YOUTUBE\DINO LE DINOSAURE\%s\07_RENDU\%s" % (scene.my_string_prop, name)
            if not os.path.exists(newpath):
                os.makedirs(newpath)
            
            scene.render.filepath = r"\\SRV-DATA1\Reseausociaux\PRODUCTIONS YOUTUBE\DINO LE DINOSAURE\%s\07_RENDU\%s\%s_####" % (scene.my_string_prop, name, name)
            #                                                Z:\PRODUCTIONS YOUTUBE\DINO LE DINOSAURE\08_EPISODE\07_RENDU\Ep_08_Pl_05_10_####.jpg
#                                     \\SRV-DATA1\Reseausociaux\PRODUCTIONS YOUTUBE\DINO LE DINOSAURE\08_EPISODE 08\07_Rendu\Playblast\Ep_08_Pl_05_1_####
            scene.render.image_settings.file_format = 'JPEG'
            scene.render.image_settings.quality = 100
            scene.render.resolution_x = 1280
            scene.render.resolution_y = 720
            scene.render.use_border = False
            scene.cycles.use_square_samples = True
            scene.cycles.samples = 17
            scene.cycles.caustics_reflective = False
            scene.cycles.caustics_refractive = False
            scene.cycles.device = 'GPU'
            scene.render.use_simplify = True
        
        for area in bpy.context.screen.areas:
        
            if area.type == 'IMAGE_EDITOR':
                area.type = 'VIEW_3D'
                
            if area.type == 'VIEW_3D':
                #area.spaces[0].region_3d.view_perspective = 'CAMERA'
                area.spaces[0].show_only_render = False
                
            
        
        return {'FINISHED'} 
##################################

#Class Operator Trou
class PlayblastSETUP(bpy.types.Operator):                  
    """Settings for render playblast"""                   
    bl_idname = "object.playblastsetup"                     
    bl_label = "Setup Playblast"        

#    @classmethod                                     
#    def poll(cls, context):                         
#        return context.active_object is not None 

    def execute(self, context):                     
        main(context)                                   
        
##################################

        name = os.path.basename(bpy.data.filepath)
        fname = str(name).split('.')
        name = fname[0]

        
        for scene in bpy.data.scenes:
            print(name)
            
            newpath = r"\\SRV-DATA1\Reseausociaux\PRODUCTIONS YOUTUBE\DINO LE DINOSAURE\%s\07_RENDU\Playblast" % (scene.my_string_prop)
            if not os.path.exists(newpath):
                os.makedirs(newpath)
            
            scene.render.filepath = r"\\SRV-DATA1\Reseausociaux\PRODUCTIONS YOUTUBE\DINO LE DINOSAURE\%s\07_RENDU\Playblast\%s_####" % (scene.my_string_prop, name)
            #                         \\SRV-DATA1\Reseausociaux\PRODUCTIONS YOUTUBE\DINO LE DINOSAURE\08_EPISODE 08\07_RENDU\Playblast\Ep_08_Pl_05_10_####.mp4
            
            scene.render.image_settings.file_format = 'H264'
            scene.cycles.device = 'CPU'
            scene.render.ffmpeg.format = 'MPEG4'
            scene.render.ffmpeg.codec = 'H264'
            scene.render.ffmpeg.muxrate = 0
            
            #scene.render.image_settings.quality = 100
            
            scene.render.resolution_x = 1280
            scene.render.resolution_y = 720
            scene.render.use_border = False
            scene.cycles.use_square_samples = True
            scene.cycles.samples = 17
            scene.cycles.caustics_reflective = False
            scene.cycles.caustics_refractive = False
            scene.render.use_simplify = False
            
        for area in bpy.context.screen.areas:
            if area.type == 'VIEW_3D':
                area.spaces[0].region_3d.view_perspective = 'CAMERA'
                #if area.type == 'SpaceView3D' :
                area.spaces[0].show_only_render = True
                #area.spaces[0].viewport_shade = 'SOLID'
        
        return {'FINISHED'} 
##################################
##################################

#Class Operator Trou
class MaterialtSETUP(bpy.types.Operator):           
    """Change material in red"""
    bl_idname = "object.materialtsetup"                     
    bl_label = "Material"  


#    @classmethod                                     
#    def poll(cls, context):                         
#        return context.active_object is not None 

    def execute(self, context):                     
        main(context)                                   
        
        
        scene = bpy.data.scenes[0]
        
        bpy.ops.object.select_all(True)
        bpy.ops.object.make_local(type='ALL')
        #'Trash_bin_Final__Cube_2_2SG'
        #material = scene.my_string_material
        bpy.data.materials[scene.my_string_material].node_tree.nodes['Diffuse BSDF'].inputs[0].default_value = (1, 0, 0, 1)
        bpy.data.materials[scene.my_string_material].node_tree.nodes['Mix Shader'].inputs[0].default_value = 0.041
        bpy.data.materials[scene.my_string_material].diffuse_color = (1, 0, 0)
        
        return {'FINISHED'} 
##################################
##################################

#Class Panel
class PanelRendu(bpy.types.Panel):
    """Ce Panel contient l'Operator qui crée un trou sur une sélection"""
    bl_label = "Setup render"
    bl_idname = "OBJECT_PT_Créer_Des_trous"
    bl_space_type = 'PROPERTIES'
#    bl_category = "Info" 
    bl_region_type = 'WINDOW'
#    bl_category = "Tools" 

    def draw(self, context):
        layout = self.layout

        layout.prop(context.scene, "my_string_prop")
        layout.prop(context.scene, "my_string_material")
        layout.operator("object.rendersetup")
        layout.operator("object.playblastsetup")
        layout.operator("object.materialtsetup")

def register():
    bpy.utils.register_class(PanelRendu)
    bpy.utils.register_class(RenderSETUP)
    bpy.utils.register_class(PlayblastSETUP)
    bpy.utils.register_class(MaterialtSETUP)
    bpy.types.Scene.my_string_prop = bpy.props.StringProperty \
      (
        name = "Episode",
        description = "My description",
        default = "08_EPISODE 08"
      )
    bpy.types.Scene.my_string_material = bpy.props.StringProperty \
      (
        name = "Material",
        description = "My description",
        default = "Trash_bin_Final__Cube_2_2SG"
      )

def unregister():
    bpy.utils.unregister_class(PanelRendu)
    bpy.utils.unregister_class(RenderSETUP)
    bpy.utils.unregister_class(PlayblastSETUP)
    bpy.utils.unregister_class(MaterialtSETUP)
    del bpy.types.Scene.my_string_prop
    del bpy.types.Scene.my_string_material

if __name__ == "__main__":
    register()