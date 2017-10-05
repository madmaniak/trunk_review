Getter __FILE__ do

  setup \
    base: :commits,
    fields: [:hash, :time, :status, :message],
    order: [ [field('time').cast(:timestamp)] ],
    limit: false,

    scope: ->(ds, params){ ds.where(field('status')=>'rejected') }

end
