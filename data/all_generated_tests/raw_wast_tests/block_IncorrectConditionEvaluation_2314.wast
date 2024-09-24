;; 5. Test a `block` combining multiple `br_if` conditions that target different `block` depths, ensuring that each condition correctly evaluates and leads to the intended branches, maintaining correct stack state.

(assert_invalid
  (module (func $nested-br_if (result i32)
    (block (result i32)
      (block (result i32)
        (br_if 1
          (i32.const 1)
        )
        (i32.const 10) 
      )
      (br_if 0
        (i32.const 0)
      )
      (i32.const 20)
    )
  ))
  "malformed branch"
)