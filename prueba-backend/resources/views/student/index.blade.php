@extends('layouts.app')

@section('template_title')
    Student
@endsection

@section('content')

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <div class="card">
                    <div class="card-header">
                        <div style="display: flex; justify-content: space-between; align-items: center;">

                            <span id="card_title">
                                {{ __('Student') }}
                            </span>

                             <div class="float-right">
                                <a href="{{ route('students.create') }}" class="btn btn-primary btn-sm float-right"  data-placement="left">
                                  {{ __('Create New') }}
                                </a>
                              </div>
                        </div>
                    </div>
                    @if ($message = Session::get('success'))
                        <div class="alert alert-success m-4">
                            <p>{{ $message }}</p>
                        </div>
                    @endif

                    <div class="card-body bg-white">
                        <div class="table-responsive">
                            <input class="form-control" id="myInput" type="text" placeholder="Search..">
                            <table class="table table-striped table-hover">
                                <thead class="table table-bordered table-striped">
                                    <tr>
                                        <th>#</th>
                                        
										<th>Name</th>

                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody id="myTable">
                                    @foreach ($students as $student)
                                        <tr>
                                            <td>{{ $student->id }}</td>
                                            
											<td>{{ $student->name }}</td>

                                            <td>
                                                <form action="{{ route('students.destroy',$student->id) }}" method="POST">
                                                    <a class="btn btn-sm btn-primary " href="{{ route('students.show',$student->id) }}"><i class="fa fa-fw fa-eye"></i> {{ __('Show') }}</a>
                                                    <a class="btn btn-sm btn-success" href="{{ route('students.edit',$student->id) }}"><i class="fa fa-fw fa-edit"></i> {{ __('Edit') }}</a>
                                                    @csrf
                                                    @method('DELETE')
                                                    <button type="submit" class="btn btn-danger btn-sm"><i class="fa fa-fw fa-trash"></i> {{ __('Delete') }}</button>
                                                </form>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                            <nav aria-label="Page navigation example">
                            <ul class="pagination">
                                    <li class="page-item"><a class="page-link" href="#">{{ $students->links() }}</li>
                                </ul> 
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function(){
          $("#myInput").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#myTable tr").filter(function() {
              $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
          });
        });
    </script>

@endsection
