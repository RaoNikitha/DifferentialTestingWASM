;; Create a test using structured control blocks (`block`, `loop`) around the `br_table` instruction, expecting the branch to correctly navigate out of and into these blocks. Misalignment here will test if structured control flow rules are being respected in the label resolution.

(assert_invalid
  (module
    (func $backward-branch-with-loop
      (block $outer
        (loop $inner
          (br_table 1 0 (i32.const 2))
        )
      )
    )
  )
  "unknown label"
)