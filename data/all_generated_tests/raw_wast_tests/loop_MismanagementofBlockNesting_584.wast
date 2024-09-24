;; Develop a scenario where a loop encloses an `if` statement that contains another loop. Utilize `br` to directly target the outermost loop from within the innermost loop. WebAssembly should handle this correctly while Wizard Engine might exit the `if` block prematurely due to context mismanagement.

(assert_invalid
  (module (func $nested-loops (result i32)
    (loop (result i32)
      (i32.const 1)
      (if (result i32)
        (then
          (loop
            (br 2)
          )
        )
      )
    )
  ))
  "type mismatch"
)