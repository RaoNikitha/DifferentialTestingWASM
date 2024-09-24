;; 4. Create a `br_table` instruction within a block that has multiple valid indices but ensure the provided index jumps beyond any possible target, confirming handling of undefined behavior due to out-of-bound accesses.

(assert_invalid
  (module
    (func (block (br_table 0 1 2 (i32.const 3))))
  )
  "unknown label"
)