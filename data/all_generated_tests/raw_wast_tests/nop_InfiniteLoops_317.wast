;; 8. Design a `loop` where the exit condition depends on a mutable global state and place a `nop` within to test if it leads to incorrect loop continuing due to state mismanagement.

(assert_invalid
 (module
  (global $counter (mut i32) (i32.const 0))
  (func (result i32)
   (loop $loop
    global.get $counter
    i32.const 10
    i32.ge_s
    if (result i32)
     global.get $counter
    else
     global.get $counter
     i32.const 1
     i32.add
     global.set $counter
     nop
     br $loop
    end
   )
  )
 )
 "type mismatch"
)