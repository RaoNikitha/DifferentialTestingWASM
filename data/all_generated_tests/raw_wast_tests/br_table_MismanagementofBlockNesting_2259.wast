;; Test9: Nested repetitive loops containing `br_table` referencing a label too shallow for the current nesting, mixing labels from different loop levels. Expect `wizard_engine` to raise immediate mismatch errors, whereas WebAssembly could end up with erroneous loop exits or unexpected traps.

(assert_invalid
  (module (func $nested_repetitive_loops
    (block
      (loop
        (loop
          (block
            (br_table 0 1 2 (i32.const 3)) (i32.const 0)
          )
        )
      )
    )
  ))
  "unknown label"
)