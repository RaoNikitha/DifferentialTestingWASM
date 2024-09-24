;; 8. **Test Description**:    - Create a function with multiple nested `block` constructs each with `call` instructions to functions with varying types.    - Use `loop` constructs to repeatedly execute parts of the function, including branches that exit the loop.    - Strategically place branches just before, within, and after `call` instructions to observe target resolution.    - **Constraint Checked**: Accuracy of nested block and loop branch target resolution around function calls.    - **Incorrect Branch Target Resolution**: Branches may incorrectly target inside/outside nested blocks or loops causing malfunctions in repetitive function calls.

(assert_invalid
  (module
    (func $f (result i32)
      (loop 
        (block 
          (call $g)
          (br 1)
        )
        (call $h)
      )
    )
    (func $g (result i32) (i32.const 0))
    (func $h (result i32) (i32.const 1))
  )
  "type mismatch"
)