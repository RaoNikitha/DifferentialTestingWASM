;; 3. **Branching into a Block with Wrong Operand Count**:    - Create a scenario where a branch instruction (`br`) jumps into a block, expecting different operand counts.    - Validate that one implementation correctly matches operand expectations, while the other causes a stack underflow or overflow.

(assert_invalid
  (module (func $branch-operand-mismatch
    (block (result i32)
      (i32.const 42)
      (block (result i32)
        (br 1)  ;; Mismatch: Branching to the outer block without operands
        (i32.const 0)
      )
    )
  ))
  "type mismatch"
)