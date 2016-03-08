import bpy

#Principe : Change l'ID de PASS pour chaque objet séléctionné.
#Lancez ce script dans le text editor de blender.


#Stock la séléction de plusieurs objects
selection = bpy.context.selected_objects

#Déséléctionne tout dans le viewport
bpy.ops.object.select_all(action='DESELECT')

#Pour chaque objects dans la selection
for obj in selection:

    #Sélectionne l'object
	obj.select = True

	#Changez '2' par l'index que vous voulez pour l'object
	obj.pass_index = 2

    #Déséléctionne l'objet
	obj.select = False

    #Sélectionne la selection d'objects
for obj in selection:
	obj.select = True