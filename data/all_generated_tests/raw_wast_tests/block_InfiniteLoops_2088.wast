;; 9. Construct a `block` with a large sequence of no-op instructions, an embedded `loop`, and a `br_table` at the end; wizard_engine's handling should lead to an infinite loop due to improper label indexing.

(assert_invalid
  (module
    (func $block-with-loop-and-br_table
      (block
        (loop
          (i32.const 0)
          (br_table 0)
        )
      )
    )
  )
  "unreachable code"
)