Integer i
Integer j

Function main
	'Power Low 'POTENCIA BAJA
	Motor On 'PRENDER MOTORES

	Speed 100 'PORCENTAJE DE VELOCIDAD MAX
	Accel 60, 60 'PORCENTAJE ACE MAX Y DESACE MAX
	
'	Do
'		Go Origen :Z(200)
'		Go Origen
'		Go Origen :Z(200)
'		Wait 0.5
'		Go EjeX :Z(200)
'		Go EjeX
'		Go EjeX :Z(200)
'		Wait 0.5
'		Go EjeY :Z(200)
'		Go EjeY
'		Go EjeY :Z(200)
'		Wait 0.5
'	Loop
	
'	Call paletizado_z
'	Call paletizado_s
	
	Do
		If Sw(9) Then
			Call paletizado_z
		EndIf
		
		If Sw(10) Then
			Call paletizado_s
		EndIf
		
		If Sw(11) Then
			Call paletizado_externo
		EndIf
		
	Loop

	
Fend

Function paletizado_z
		
	#define estado_paletizado_z 11
	
	Pallet 1, Origen, EjeX, EjeY, 3, 3
	
	On estado_paletizado_z
	For i = 1 To 9
		Go Pallet(1, i) :Z(200)
		Go Pallet(1, i)
		Go Pallet(1, i) :Z(200)
	Next
	Off estado_paletizado_z
Fend

Function paletizado_s
		
	#define estado_paletizado_s 12
	
	Pallet 1, Origen, EjeX, EjeY, 3, 3
	
	On estado_paletizado_s
	
	For i = 1 To 3
		Go Pallet(1, i) :Z(200)
		Go Pallet(1, i)
		Go Pallet(1, i) :Z(200)
	Next
	
	For i = 6 To 4 Step -1
		Go Pallet(1, i) :Z(200)
		Go Pallet(1, i)
		Go Pallet(1, i) :Z(200)
	Next
	
	For i = 7 To 9
		Go Pallet(1, i) :Z(200)
		Go Pallet(1, i)
		Go Pallet(1, i) :Z(200)
	Next
	
	Off estado_paletizado_s
Fend

Function paletizado_externo
		
	#define paletizado_externo 13
	
	Pallet Outside, 2, Origen, EjeX, EjeY, 3, 3
	
	On paletizado_externo
	For i = 1 To 4
		For j = 1 To 4
			Go Pallet(2, i, j) :Z(200)
			Go Pallet(2, i, j)
			Go Pallet(2, i, j) :Z(200)
		Next
	Next
	Off paletizado_externo
Fend

