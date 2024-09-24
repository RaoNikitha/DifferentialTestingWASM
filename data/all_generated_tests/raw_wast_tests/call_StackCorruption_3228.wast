;; 7. Experiment with interleaving different types of instructions (e.g., arithmetic and call instructions). Check if call instruction impacts stack manipulation of these other instruction types leading to erroneous states.

(assert_invalid
  (module
    (func $f1 (param i32 i32))
    (func $f2 (param i32))
    (func (param i32) (result i32)
      (i32.add 
        (call $f1 (i32.const 1) (i32.const 2)) ; Interleave call with arithmetic
        (call $f2 (i32.const 3))
      )
    )
  )
  "type mismatch"
)