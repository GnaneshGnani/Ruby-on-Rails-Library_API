class Api::BooksController < ApplicationController
    # GET /books
    def index
        @books = Book.all
        if @books
            render json: {message: 'Books fetched.', data: @books}, status: 200
        else
            render error: {error: 'Unable to fetch Books.'}, status: 400
        end
    end

    # GET /book/:id
    def show
        @book = Book.find(params[:id])
        if @book
            render json: {message: 'Book fetched.', data: @book}, status: 200
        else
            render error: {error: 'Unable to fetch Books.'}, status: 400
        end
    end

    # POST /books
    def create
        puts book_params
        @book = Book.new(book_params)
        if @book.save
            render json: {message: 'Book created.', data: @book}, status: 200
        else
            render error: {error: 'Unable to create Book.'}, status: 400
        end
    end

    # PUT /books/:id
    def update
        @book = Book.find(params[:id])
        if @book
            # @book.update(book_params)
            @book.update(B_title: params[:B_title], Author: params[:Author], Publisher: params[:Publisher], Year: params[:Year])
            render json: {message: 'Book updated.', data: @book}, status: 200
        else
            render error: {error: 'Unable to update Book.'}, status: 400
        end
    end 

    # DELETE /users/:id
    def destroy
        @book = Book.find(params[:id])
        if @book
            @book.destroy
            render json: {message: 'Book deleted.'}, status: 200
        else
            render error: {error: 'Unable to delete Book.'}, status: 400
        end
    end

    private

    def book_params
        params.require(:book).permit(:B_id, :B_title, :Author, :Publisher, :Year)
    end
end
