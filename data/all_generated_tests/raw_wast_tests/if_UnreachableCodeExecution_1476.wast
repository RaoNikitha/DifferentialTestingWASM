;; 7. Combine multiple control instructions (`blocks`, `loops`, `br` and `br_if`) around valid `if` statements, but improperly manage the jumps to trigger `unreachable` instructions in nested contexts. The test ensures nested structure management by the context.

(assert_invalid
  (module (func $unreachable-in-nested-br (result i32)
    (block (result i32)
      (loop (result i32)
        (if (result i32) (i32.const 1)
          (then (block (br 1 (unreachable))))
          (else (i32.const 0))
        )
      )
    )
  ))
  "unreachable executed"
)