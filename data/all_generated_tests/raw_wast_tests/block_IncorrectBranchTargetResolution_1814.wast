;; 5. **Test Description**: Construct a chain of blocks each ending in `br` to the next outer block, but introduce a logic error after a few blocks to attempt a backward branch. Check if implementations correctly disallow backward branch targets, exposing potential label mismanagement.

(assert_invalid
  (module (func $nested-blocks-with-backward-branch
    (block (br 1))
    (block (br 2))
    (block (br 1))
    (br 0) ;; This should cause a backward branch error
  ))
  "invalid label"
)