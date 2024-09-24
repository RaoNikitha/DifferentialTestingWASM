;; 3. **Test Description 3**: Implement a `loop` that takes a single integer argument and produces a double. Use `br_if` within the loop, conditioned on the loop variable. Ensure that stack asymmetries are caught where `wizard_engine` should treat `loop` inputs differently from block results.

(assert_invalid
  (module
    (func $test
      (loop (result f64)
        (local f64)
        (local.set 0 (f64.convert_s/i32 (i32.const 42)))
        (br_if 0 (local.get 0))
      )
    )
  )
  "type mismatch"
)