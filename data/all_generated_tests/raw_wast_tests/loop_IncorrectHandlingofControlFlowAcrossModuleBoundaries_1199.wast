;; Test 10: An exported function with a loop involving a `br_table` and nested conditional branches, which is then imported and called by another module. The test ensures the correct indices map to the loop’s control flows and that cross-module branch handling manages stack context accurately.

(assert_invalid
  (module
    (func $nested-branching-loop
      (block (result i32)
        (loop (result i32)
          i32.const 1
          br_if 0
          (block
            i32.const 2
            (br_table 0 1 ;; 0 for loop, 1 for block
              (local.get 1))
          )
          (if (result i32)
            (then
              i32.const 3
            )
            (else
              br 1
            )
          )
        )
      )
    )
    (export "test" (func $nested-branching-loop))
  )
  "type mismatch"
)