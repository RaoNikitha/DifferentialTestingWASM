;; 6. Branch into inappropriate structured control:    Construct an instruction set where a `br` instruction attempts to branch into the middle of a block, violating structured control flow. This tests the preservation of well-nested control in CFG.

(assert_invalid
 (module
  (func $branch_into_middle_of_block
   (block
    (i32.const 1)
    (br 1) ;; This should fail because it's an invalid attempt to branch into the middle of a block
    (i32.const 2)
   )
  )
 )
 "unknown label"
)