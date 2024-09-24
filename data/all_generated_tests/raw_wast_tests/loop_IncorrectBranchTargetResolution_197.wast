;; 8. Craft a loop with `try`-`catch` blocks within it, and embed `br` instructions that target specific labels within the loop and catch blocks. Check if the branches correctly resolve both normal and exceptional code paths, focusing on label management in try-catch structures within loops.

(assert_invalid
 (module
  (func $type-param-result
   (result i32)
   (block
    (loop (result i32)
     (try
      (do (i32.const 1) (br 1))
      (catch (i32.const 2))
     )
     (br 0)
    )
   )
  )
 )
 "type mismatch"
)