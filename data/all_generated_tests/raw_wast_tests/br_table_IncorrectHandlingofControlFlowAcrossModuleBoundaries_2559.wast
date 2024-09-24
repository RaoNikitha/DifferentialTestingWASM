;; **Test 8: Well-nested imported function br_table misinterpreting nesting depth** - Module A's function includes a well-nested handled br_table but with a label misinterpreting nesting depth. - Imported and executed within Module B’s boundary. - Evaluating if `wizard_engine` halts due to depth mismatch while WebAssembly executes disregarding.

(assert_invalid
  (module
    (func $test
      (block
        (block
          (br_table 0 2 (i32.const 0))  ;; Incorrectly indexed label, misinterpreting nesting depth
        )
      )
    )
  )
  "unknown label"
)