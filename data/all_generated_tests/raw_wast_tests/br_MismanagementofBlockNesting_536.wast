;; 7. Design a test that contains a `block` with multiple nested `block` instructions, then use a `br_table` to jump to various levels of nested blocks. This tests whether the implementation correctly handles different target labels and their relative indices.

(assert_invalid
  (module
    (func $nested-blocks-with-br_table
      (block
        (block
          (block
            (block
              (block
                (i32.const 0)
                (br_table 0 1 2 3 4 (i32.const 2))
              )
            )
          )
        )
      )
      (i32.eqz) (drop)
    )
  )
  "unknown label"
)