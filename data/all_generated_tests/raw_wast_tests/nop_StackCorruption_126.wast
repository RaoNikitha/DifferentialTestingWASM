;; 7. Utilize `nop` within a function containing `br` and `br_if` instructions to ensure the `nop` instructions are correctly skipped and the stack consistency is preserved when jumping labels or conditional branches are encountered.

(assert_invalid
  (module
    (func (block (nop) (br 0) (nop)))
  )
)