;; 6. **Test `nop` within a Sequence of Stack Manipulations**:    Introduce `nop` between a series of stack operations (e.g., `push`, `pop`) to verify the stack state remains unaltered.

(assert_invalid
 (module
  (func $test
   i32.const 1
   nop
   i32.const 2
   drop
   drop
  )
  "type mismatch"
 )
)