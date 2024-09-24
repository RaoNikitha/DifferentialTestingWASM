;; 9. Construct a nested control structure where `nop` and `br_if` instructions interact. Confirm WebAssembly handles nested conditions accurately; wizard_engine may display incorrect branching due to debug trace.

(assert_invalid
  (module
    (func $test (block
      (loop
        (if (i32.const 0)
          (then
            (br_if 1 (nop))
          )
        )
      )
    ))
  )
  "type mismatch"
)