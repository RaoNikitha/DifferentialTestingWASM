;; 4. Ensure the correct operand handling when `br` results in a backward jump within a loop inside an imported function, verifying that stack is correctly managed crossing the module boundary.

(assert_invalid
  (module
    (import "env" "external_function" (func $external (result i32)))
    (func $test
      (block (result i32)
        (loop (result i32)
          (call $external)
          (br 0))
      )
    )
  )
  "type mismatch"
)