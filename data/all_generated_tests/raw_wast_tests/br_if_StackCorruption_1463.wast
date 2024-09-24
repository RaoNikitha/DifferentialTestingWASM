;; 4. **Test Description 4**: Define a complex nested `block` structure with multiple `br_if` instructions targeting various `block` levels. Push different data types onto the stack within each block and use `br_if` conditionally. Check for stack integrity after each `br_if` execution and identify if the stack unwinding correctly matches the expected state.

(assert_invalid
  (module
    (func $nested-blocks
      (block (result i32) ;; Label 0
        (i32.const 42)
        (block (result i32) ;; Label 1
          (i32.const 84)
          (block
            (i32.const 126)
            (br_if 2 (i32.const 1)) ;; Branch to Label 0
            (i32.const 168)
          )
          (drop)
          (br_if 1 (i32.const 0)) ;; No branch
        )
        (br_if 0 (i32.const 1)) ;; Branch to Label 0
      )
      (i32.const 200) (drop)
    )
  )
  "type mismatch"
)