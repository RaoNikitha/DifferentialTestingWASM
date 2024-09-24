;; 3. Test indirect function calls within nested control structures:    - Use `call_indirect` to invoke functions indirectly from within nested blocks and loops, ensuring the correct functions are called and returned from.    - Ensure type consistency and proper stack handling across the function boundaries.

(assert_invalid
  (module
    (type $sig_i (func (result i32)))
    (table 10 funcref)
    (elem (i32.const 0) $func1 $func2)
    (func $func1 (result i32) (i32.const 42))
    (func $func2 (result i32) (block (loop (br 1 (call_indirect (type $sig_i) (i32.const 0))))))
    (func (result i32)
      (block (result i32)
        (loop (result i32)
          (br_if 0 (return (block (result i32)
            (call_indirect (type $sig_i) (i32.const 1))
          )))
        )
      )
    )
  )
  "type mismatch"
)