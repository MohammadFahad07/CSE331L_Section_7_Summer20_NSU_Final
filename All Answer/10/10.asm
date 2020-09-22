
DATA SEGMENT
    num1 db ?
    num2 db ?
    res DB ?
    MSG1 DB 10,13,"Enter int 1: $"
    MSG2 DB 10,13,"Enter int 2: $"
    MSG3 DB 10,13,"SUB: $"
DATA ENDS   

ASSUME CS:CODE,DS:DATA

CODE SEGMENT
    START: MOV AX,DATA
           MOV DS,AX           
           
           LEA DX,MSG1      
           MOV AH,9H           
           INT 21H    
           
           MOV AH,1H           
           INT 21H
           SUB AL,30H         
           MOV NUM1,AL        
           
           LEA DX,MSG2         
           MOV AH,9H           
           INT 21H    
           
           MOV AH,1H          
           INT 21H
           SUB AL,30H         
           MOV NUM2,AL         
           
           MOV AL,num1         
           SUB AL,num2         
           MOV RES,AL          
           MOV AH,0            
           AAA                  
           ADD AH,30H          
           ADD AL,30H          
           
           MOV BX,AX           
           LEA DX,MSG3         
           MOV AH,9H
           INT 21H
           
           MOV AH,2H           
           MOV DL,BH                                
           INT 21H
           
           MOV AH,2           
           MOV DL,BL
           INT 21H
    
           MOV AH,4CH
           INT 21H
    
CODE ENDS
END START