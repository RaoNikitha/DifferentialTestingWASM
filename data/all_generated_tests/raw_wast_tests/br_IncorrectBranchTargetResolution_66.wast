;; 7. Develop a nested `if`-within-`block` scenario where a `br` instruction should correctly target the innermost `if`. Verify the label depth and relative offset resolution.

(assert_invalid
 (module
  (func $nested-if-block
   (block
    (if (i32.const 1)
     (then 
      (if (i32.const 1) 
       (then 
        (br 3)
       )
      )
     )
    )
   )
  )
 )
 "unknown label"
)