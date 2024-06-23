##! /usr/bin/python -i
"""
This copies all .png files from the airplane subfolders in the current folder to the matching airplane folders in DCS.  It will only copy if there is a matching folder in DCS.
"""

import glob
import subprocess
import os
import shutil

# Set up an array of the folder names that have kneeboards for multiple DCS aircraft.
multiplaneDirs = {
	# Gazelle
	'SA342 (all)': {
		'SA342L',
		'SA342M',
		'SA342Minigun',
		'SA342Mistral',
	},
	# MiG-29A, MiG-29G, MiG-29S
	'MiG-29 (all)': {
		'MiG-29A',
		'MiG-29G',
		'MiG-29S',
	},
	# Su-27, Su-33, J-11A
	'Su-27 (all)': {
		'Su-27',
		'Su-33',
		'J-11A',
	},
	# F-14A, F-14B
	'F-14 (all)': {
		'F-14A-135-GR',
		'F-14B',
	},
#	# C-101CC, C-101EB
#	'C-101 (all)': {
#		'C-101CC',
#		'C-101EB',
#	},
	# L-39C, L-39ZA
	'L-39 (all)': {
		'L-39C',
		'L-39ZA',
	},
	# A-10C, A-10C_2
	'A-10C (all)': {
		'A-10C',
		'A-10C_2',
	},
	# MB-339A, MB-339APAN
	'MB-339A (all)': {
		'MB-339A',
		'MB-339APAN',
	},
}
#print(multiplaneDirs)

# NOTE os.environ['USERPROFILE'] should be something like "C:\Users\<username>" (no trailing backslash).
userProfile = os.environ['USERPROFILE']
#print(userProfile)

###
# Iterate through all the subfolders in current folder and delete existing .png files from matching folder in DCS Kneeboard folder.
###
for filepath in glob.iglob('*'):
	basename = os.path.basename(filepath)
	filenameNoExt = os.path.splitext(basename)[0]
	if os.path.isdir(filepath):
		#print(filepath)
		# If the dir matches one of the multiplane directories we have set up above, we need to split out the multiplane directory into the actual DCS plane folder names.
		if basename in multiplaneDirs.keys():
			for multiDir in multiplaneDirs[basename]:
				#print(f'{userProfile}/Saved Games/DCS.openbeta/Kneeboard/{multiDir}')
				if os.path.isdir(f'{userProfile}/Saved Games/DCS.openbeta/Kneeboard/{multiDir}'):
					print(f'Deleting existing *.png kneeboard files from {userProfile}/Saved Games/DCS.openbeta/Kneeboard/{multiDir} ...')
					for file in glob.iglob(f'{userProfile}/Saved Games/DCS.openbeta/Kneeboard/{multiDir}/*.png'):
						#print(f'Deleting {file}')
						os.remove(file)
						
					print(f'Copying {basename}/pngs/*.png to {userProfile}/Saved Games/DCS.openbeta/Kneeboard/{multiDir} ...')
					for file in glob.iglob(f'{basename}/pngs/*.png'):
						fileBasename = os.path.basename(file)
						#print(f'Copying {fileBasename}')
						shutil.copy(f'{basename}/pngs/{fileBasename}', f'{userProfile}/Saved Games/DCS.openbeta/Kneeboard/{multiDir}')
		
		# Else this is not a multiplane dir and should match one of the DCS plane folders exactly by name.
		else:
			if (os.path.exists(f'{userProfile}/Saved Games/DCS.openbeta/Kneeboard/{basename}')):
				print(f'Deleting existing *.png kneeboard files from {userProfile}/Saved Games/DCS.openbeta/Kneeboard/{basename} ...')
				for file in glob.iglob(f'{userProfile}/Saved Games/DCS.openbeta/Kneeboard/{basename}/*.png'):
					#print(f'Deleting {file}')
					os.remove(file)
					
				print(f'Copying {basename}/pngs/*.png to {userProfile}/Saved Games/DCS.openbeta/Kneeboard/{basename} ...')
				for file in glob.iglob(f'{basename}/pngs/*.png'):
					fileBasename = os.path.basename(file)
					#print(f'Copying {fileBasename}')
					shutil.copy(f'{basename}/pngs/{fileBasename}', f'{userProfile}/Saved Games/DCS.openbeta/Kneeboard/{basename}')


###
# Then copy all the special or global kneeboard pages.
###

# All planes need the global conversion tables and RWR pages.
globalKneeboards = [
	'001 - Conv nmi-km 1-100, C-F, Declination, Hotkeys.png',
	'002 - Conv nmi-km-ft 0.01-1.00, Morse Code.png',
	'003 - Conv hpa-mmHg-inHg.png',
	'004 - Threat database, RWR.png',
	'006 - MP Server Notes.png',
	'007 - MP Server Notes - Pretense.png',
	# Add more to this list as needed...
]
for filepath in glob.iglob(f'{userProfile}/Saved Games/DCS.openbeta/Kneeboard/*'):
	if os.path.isdir(filepath):
		print(f'Copying common kneeboards to {filepath} ...')
		for kneeboard in globalKneeboards:
			#print(f'Copying Global Kneeboard Pages/pngs/{kneeboard} to {filepath}')
			shutil.copy(f'Global Kneeboard Pages/pngs/{kneeboard}', f'{filepath}')

# FC3 planes need the airport ID page.
fc3Kneeboards = [
	'005 - Airport IDs.png',
	# Add more FC3 kneeboards to this list as needed...
]
fc3Planes = [
	'A-10A',
	'F-15C',
	'MiG-29A',
	'MiG-29G',
	'MiG-29S',
	'Su-25',
	'Su-25T',
	'Su-27',
	'Su-33',
	'J-11A',
]
for filepath in glob.iglob(f'{userProfile}/Saved Games/DCS.openbeta/Kneeboard/*'):
	basename = os.path.basename(filepath)
	if os.path.isdir(filepath) and basename in fc3Planes:
		print(f'Copying FC3 kneeboards to {filepath} ...')
		for kneeboard in fc3Kneeboards:
			#print(f'Copying Global Kneeboard Pages/pngs/{kneeboard} to {filepath}')
			shutil.copy(f'Global Kneeboard Pages/pngs/{kneeboard}', f'{filepath}')

input('Press enter to exit')
