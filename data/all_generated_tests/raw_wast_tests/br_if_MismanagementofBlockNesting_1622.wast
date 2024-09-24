;; 3. **Test 3**: - **Description**: Complex `block` structure with nested `block`, `loop`, and `if`, where `br_if` targets an outer `block` from deep within the nested structure. - **Constraint Checked**: Correct resolution of `br_if` target across multiple nesting levels.

(assert_invalid
  (module
    (func
      (block (result i32)
        (block (loop
          (if (i32.const 1)
            (then 
              (block
                (br_if 2 (i32.const 1))
              )
            )
          )
        )))
      )
    )
  )
  "type mismatch"
)