@REM "C:\Program Files\Blender Foundation\Blender\blender.exe" -b plan02_ep05.blend -f 24 -f 41 -f 72
@REM Chemin application -b chemin_fichier_a_rendre -f numero -f numero_img -f numero_img -f numero_img

@echo #####################
@echo Calcul des images ...
@echo #####################

REM "C:\Program Files\Blender Foundation\Blender\blender.exe" -b Episode_03_Partie_01_Compress.blend -f 2728 -f 2735 -f 2741 -f 2748 -f 2754 -f 2762 -f 2767 -f 2774 -f 2782 -f 2789 -f 2796 -f 2803 -f 2812 -f 2820 -f 2827 -f 2835 -f 2840 -f 2848 -f 2855 -f 2861 -f 2869 -f 2878 -f 2885 -f 2890 -f 2897 -f 2904 -f 2910 -f 2917 -f 2924 -f 2931 -f 2937 -f 2943 -f 2950 -f 2957 -f 2963 -f 2970 -f 2976 -f 2983 -f 2990 -f 2996 -f 3003 -f 3010 -f 3016 -f 3023 -f 3030 -f 3037 -f 3046 -f 3053 -f 3059 -f 3066 -f 3074 -f 3082 -f 3089 -f 3096 -f 3103 -f 3111 -f 3118 -f 3124 -f 3132 -f 3139 -f 3146 -f 3154 -f 3160 -f 3167 -f 3175 -f 3182 -f 3190 -f 3195 -f 3203 -f 3211 -f 3217 -f 3224 -f 3233 -f 3241 -f 3248 -f 3254 -f 3261 -f 3268 -f 3274 -f 3281 -f 3288 -f 3294 -f 3300 -f 3308 -f 3313 -f 3320 -f 3327 -f 3332 -f 3339 -f 3346 -f 3352 -f 3359 -f 3366 -f 3373 -f 3379 -f 3387 -f 3394 -f 3400 -f 3407 -f 3415 -f 3421 -f 3427 -f 3435 -f 3441 -f 3448 -f 3455 -f 3462 -f 3468 -f 3476 -f 3483 -f 3489 -f 3495 -f 3501 -f 3507 -f 3514 -f 3521 -f 3526 -f 3535 -f 3541 -f 3547 -f 3555 -f 3562 -f 3569 -f 3576 -f 3583 -f 3590 -f 3597 -f 3604 -f 3626 -f 3634 -f 3640 -f 3647 -f 3667 -f 3676 -f 3682 -f 3688 -f 3695 -f 3701 -f 3708 -f 3715 -f 3721 -f 3729 -f 3735 -f 3742 -f 3750 -f 3757 -f 3763 -f 3770 -f 3777 -f 1

REM "C:\Program Files\Blender Foundation\Blender\blender.exe" -b plan11_EP05.blend -s 252 -e 400 -F JPEG -x 1 -a

"C:\Program Files\Blender Foundation\Blender\blender.exe" -b \\SRV-DATA1\Reseausociaux\PRODUCTIONS YOUTUBE\DINO LE DINOSAURE\04_EPISODE 04\03_ANIMATION\Rt_1\Ep_04_Pl_06.blend -x 1 -F JPEG -s 28 -e 250 -a 




@echo ###############################################################
@echo ######################Rendu fini###############################
@echo ###############################################################
@echo ###   Le rendu peut avoir des erreurs. Pensez a faire une   ###
@echo ###       verification des rendu avant des les ranger       ###
@echo ###############################################################

@REM msg * /server:"COMPUTERNAME" "MESSAGE"
@msg * /server:"MM-00034-PRO" "Rendu fini sur le poste MM-00008-DIG"
@Pause>nul

@REM idee 
@REM demande un nom de fichier a rendre
@REM	demander un numero d image a rendre
@REM	demander si il faut ajouter une autre image
@REM		demander un numero d image a rendre
@REM		boucle
@REM	Si non autre fichier a rendre ?
@REM		boucle
@REM	Envoie de message sur un autre pc du reseau ?
@REM		Oui : Demander le nom du pc "MM-00008-DIG"
@REM		le message dit quel fichier on été rendu et quel images.
@REM	Si non
@REM	Lancement du rendu