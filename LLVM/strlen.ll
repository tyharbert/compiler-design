; Tyler Harbert
; LLVM String Length

; global string
@globstr = global [13xi8] c"input string\00"

; for printing
declare i32 @puts(i8*)

define i32 @main {

    ret 0
}

define i32 @strlen(i8* %str){
    
    ; this is our iterator
    %offset = alloc i32
    ; store 0 in iterator
    store i32 0, i32* %offset
    
condit:
    %idx = load i32* %offset
    %str1 = getelementptr inbounds i8* %str, i32 %idx
    %char = load i8* %str1
    
    %res = icmp eq i8 %char, 0
    br i1 %res, label %end, label %body
    
body:
    %cur_offset = load i32* %offset
    %new_offset = add nsw i32 %cur_offset, 1
    store i32 %new_offset, i32* %offset
    br label %condit
    
end:
    %ans = load i32* %len
    ret i32 %ans
}