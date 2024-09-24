;; 9. **Branch to End Block with Nops**: Create a block structure with a combination of loops and conditional branches where `nops` precede a `br` targeting the end block. This tests if the branch correctly exits the healthy path to the end block instead of looping or erroneous targeting due to `nop`.

(assert_invalid
  (module
    (func $branch_to_end (block
                            (nop)
                            (br 1)
                            (nop)
                            (block (nop) (br 1))
                            (nop)))
  "unknown label")
)