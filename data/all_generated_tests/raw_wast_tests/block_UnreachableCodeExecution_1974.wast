;; 5. **Block with Incorrect Label Indexing Hitting Unreachable**:    - Create a `block` with complicated label indexing (e.g., multiple branch instructions referencing different blocks). Mismanagement of label indices by the context might lead to the execution path erroneously reaching an `unreachable` instruction within a nested block.

(assert_invalid
 (module
  (func $nested-blocks-invalid-label (result i32)
   (block (result i32)
    (block (result i32)
     (br 2 (unreachable)) ;; incorrect label index
    )
    (i32.const 0)
   )
  )
 )
 "unknown label"
)