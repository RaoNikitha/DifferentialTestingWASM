;; 2. **Immediate Outward Branching**: A block with an immediate branch (`br 0`) at the start, having another `block` inside. This tests the resolution of the simplest outward branch in `wizard_engine`.

(assert_invalid
  (module (func
    (block (result i32)
      (br 0) 
      (block (result i32) (nop))
    )
  ))
  "type mismatch"
)