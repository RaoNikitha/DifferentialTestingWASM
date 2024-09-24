;; Test 3: Design a WebAssembly module with a `block` containing a `br_if` that depends on a comparison between two variables. Evaluate branching with true conditions (e.g., variable1 == variable2) and verify correct branching. Checks for correct true condition evaluation.

(assert_invalid
  (module
    (func $test3 (param i32 i32)
      (block (br_if 0
        (i32.eq
          (local.get 0)
          (local.get 1)
        )
      ))
    )
  )
  "type mismatch"
)