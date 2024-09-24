;; 4. **Hierarchical Blocks with Interleaved Nops**: Construct nested blocks with interleaved `nop` instructions and `br` instructions targeting different levels of the hierarchy. This checks if the branch targets resolve to the correct block level, ensuring the `nop` does not alter the target resolution chain.

(assert_invalid
  (module
    (func (block (block (br 1) (nop)) (br 0) (nop)))
  )
  "type mismatch"
)