;; Test3: Design an `if` condition with nested blocks in both the `then` and `else` branches, where `br_table` references labels outside of the innermost structure. Expect `wizard_engine` to detect the mismatch immediately, while WebAssembly might cause incorrect block exits resulting in traps or unintended behavior.

(assert_invalid
  (module (func $test3
    (if (i32.const 1)
      (then (block (block (br_table 1 2 (i32.const 0)))))
      (else (block (br_table 0 3 (i32.const 1))))
    )
  ))
  "unknown label"
)