;; 10. Create a test where an imported function is called within a try-catch block to handle potential traps. Verify that the function indices are correctly validated and that the error or trap handling reports unknown function indices as expected, especially when transitioning between modules.

(assert_invalid
  (module
    (import "env" "external_func" (func $ext (param i32)))
    (func $f (param i32)
      (try
        (do (call $ext (i32.const 42)))
        (catch)
      )
    )
  )
  "unknown function"
)