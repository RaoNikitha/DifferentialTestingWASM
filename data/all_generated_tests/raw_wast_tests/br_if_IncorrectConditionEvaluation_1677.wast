;; 8. A structure with a `loop` containing a `block`, and a `br_if` targeting the `block` based on a dynamically computed condition. The test examines if the dynamic condition evaluation accurately affects the branch decision.

(assert_invalid
  (module
    (func $test-loop-block-br_if
      (loop $loop_label
        (block $block_label
          (i32.const 1) (i32.const 1) (i32.add)
          (br_if 0 (i32.const 0)) (br 1)
        )
        (br $loop_label)
      )
    )
  )
  "type mismatch"
)