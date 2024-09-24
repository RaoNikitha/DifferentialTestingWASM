;; 6. Inserting `nop` instructions before and after memory manipulation operations (such as `load` and `store`) to validate that the operand stack is correctly managed and no spurious values are introduced or removed by `nop`.

(assert_invalid
 (module
  (memory 1)
  (func $mem-nop
   i32.const 0
   nop
   i32.load
   nop
   drop
  )
 )
 "type mismatch"
)