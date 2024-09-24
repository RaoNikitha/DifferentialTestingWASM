;; 5. Create a structure with a `loop` that contains a nested `block`, where a `br 0` in the `block` targets the `loop`. This should effectively create a backward jump to the start of the loop, ensuring no mismanagement occurs within the nested structure.

(assert_invalid
  (module 
    (func (loop 
      (block 
        (br 0)
      )
    ))
  )
  "unknown label"
)