;; 5. Construct a nested set of blocks where a `br` instruction within the innermost block refers to a misindexed label, leading to an unreachable instruction to check for inaccurate label indexing.

(assert_invalid
 (module
  (func $misindexed-br (result i32)
   (block (result i32)
    (block (result i32)
     (block (result i32)
      (br 3 (i32.const 42))
     )
    )
    (i32.const 0)
   )
  )
 )
 "unknown label"
)