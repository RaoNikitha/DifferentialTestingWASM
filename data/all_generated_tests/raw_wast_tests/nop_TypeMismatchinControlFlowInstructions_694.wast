;; 5. **Mismatched Loop and Break Types**:    - Construct a loop that expects an integer type and has a `nop` inside it, followed by a break operation producing a float.    - This test checks if the loop maintains the correct stack type even with `nop`.    - **Reasoning**: Validates type correctness upon exiting loop with a different type post-nop.

(assert_invalid
  (module 
    (func (result f32)
      (loop (result i32)
        (nop)
        (br 0 (f32.const 1.0))))
  )
  "type mismatch"
)