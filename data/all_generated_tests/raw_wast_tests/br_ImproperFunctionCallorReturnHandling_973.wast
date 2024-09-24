;; 4. **Forward Branch Post Function Return:**    - Test a `block` that includes a function call (`call`) and an immediate `br` instruction targeting a higher block level upon function return. Ensure the operand stack management as the branch executes is consistent across implementations.

(assert_invalid
  (module
    (func $forward-branch-post-func (result i32)
      (block (result i32) 
        (call $dummy-func) 
        (br 1)
      )
      (i32.const 0) 
    )
    (func $dummy-func (result i32)
      (i32.const 42) 
    )
  )
  "type mismatch"
)