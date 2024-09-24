;; 4. **Misaligned Branch Indexing**: Mix several blocks and loops, and branch statements (`br`, `br_if`) that deliberately use incorrect label indices (off-by-one indexing). This checks how `wizard_engine` handles misaligned or invalid label references.

(assert_invalid
  (module
    (func $misaligned-branch-index
      (block (result i32)
        (i32.const 42)
        (block (result i32)
          (loop (result i32)
            (i32.const 0)
            (br 3)
          )
        )
      )
    )
  )
  "unexpected label index"
)