;; 8. **Out-of-Bounds Branching Attempt:**    Attempt a `br` instruction targeting a label index that is clearly beyond the top-level block’s depth. Check if the implementation can gracefully handle such errors by checking bounds appropriately and issuing an error.

(assert_invalid
  (module
    (func (block (br 3)))
  )
  "unknown label"
)