;; Create a nested loop where entering the inner loop depends on a prior `br_if` in an enclosing `if` block. This should work in WebAssembly, but the Wizard Engine may misinterpret the label stack and fail when conditional branches cause re-entry to the inner loop.

(assert_invalid
  (module
    (func $nested-loop-branch (param i32) (result i32)
      (local i32)
      (block
        (drop
          (br_if 0 (local.get 0))
        )
        (loop (result i32)
          (block (loop
            (local.set 0 (i32.const 1))
            (br_if 0 (i32.const 0))
          ))
        )
      )
    )
  )
  "type mismatch"
)